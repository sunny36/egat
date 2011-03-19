class OilQuality < ActiveRecord::Base
  belongs_to :color

  def self.find_all_by_name_and_transformer(name, transformer)
    if name == 'color'
      return OilQuality.where(:name => name)
    end
    u = transformer.hv
    oil_qualities = OilQuality.where(:name => name)
    ids = Array.new
    oil_qualities.each do |oil_quality|
      oil_quality.u_start = 0 if oil_quality.u_start.nil?
      oil_quality.u_end = 1000000 if oil_quality.u_end.nil?
      if u.between?(oil_quality.u_start, oil_quality.u_end)
        ids << oil_quality.id
      end
    end
    oil_qualities.where(:id => ids)
  end


  def hi_factor(insulating_oil, oil_contamination, type)
    return nil if insulating_oil.blank? || oil_contamination.blank?
    if type == :oil_quality
      OilQualityFactor.all.each do |oil_quality_factor|
        oil_quality_factor.start = 0 if oil_quality_factor.start.nil?
        oil_quality_factor.end = 1000000 if oil_quality_factor.end.nil?
        condition = percent_oil_quality_factor(insulating_oil, oil_contamination).between?(oil_quality_factor.start,
                                                                                           oil_quality_factor.end)
        if condition
          return oil_quality_factor.hi_factor
        end
      end
    end
    if type == :contamination
      OilContaminationFactor.all.each do |oil_contamination_factor|
        oil_contamination_factor.start = 0 if oil_contamination_factor.start.nil?
        oil_contamination_factor.end = 1000000 if oil_contamination_factor.end.nil?
        condition = percent_contamination_factor(insulating_oil,
                                                 oil_contamination).round.between?(oil_contamination_factor.start, 
                                                 oil_contamination_factor.end)
        if condition
          return oil_contamination_factor.hi_factor
        end
      end
    end
  end

  def hi_factor_color(insulating_oil, oil_contamination, type)
    return nil if insulating_oil.blank? || oil_contamination.blank?
    OilQualityFactor.where('hi_factor = ?', hi_factor(insulating_oil, oil_contamination)).first.color.value
  end

  def test_date(insulating_oil, oil_contamination)
    return nil if insulating_oil.blank? || oil_contamination.blank?
    "#{oil_contamination.thai_test_date}, #{insulating_oil.thai_test_date}(BD)"
  end

  def percent_oil_quality_factor(insulating_oil, oil_contamination)
    return nil if insulating_oil.blank? || oil_contamination.blank?
    (numerator(insulating_oil, oil_contamination).to_f / denominator.to_f) * 100
  end

  def percent_contamination_factor(insulating_oil, oil_contamination)
    return nil if insulating_oil.blank? || oil_contamination.blank?
    numerator = numerator(insulating_oil, oil_contamination).to_f +
      (power_factor_score(insulating_oil, :twenty_degrees) * OilQuality.where(:name => 'pf_20c').first.weight.to_i) +
      (power_factor_score(insulating_oil, :hundred_degrees) * OilQuality.where(:name => 'pf_100c').first.weight.to_i)
    _denominator = denominator.to_f
    ['pf_20c', 'pf_100c'].each do |field|
      oil_quality = OilQuality.where('name = ?', field).order('score DESC').first
      max_score = oil_quality.score.to_i
      weight = oil_quality.weight.to_i
      _denominator = _denominator + (max_score * weight)
    end
    (numerator / _denominator) * 100.0
  end

  def numerator(insulating_oil, oil_contamination)
    dielectric_breakdown_score_times_weight = dielectric_breakdown_score(insulating_oil) *
    OilQuality.where('name = ?', 'xbar').first.weight.to_i
    ift_score_times_weight = ift_score(oil_contamination) *
    OilQuality.where('name = ?', 'ift').first.weight.to_i
    nn_score_times_weight = nn_score(oil_contamination) *
    OilQuality.where('name = ?', 'nn').first.weight.to_i
    water_content_score_times_weight = water_content_score(oil_contamination) *
    OilQuality.where('name = ?', 'water_content').first.weight.to_i
    color_score_times_weight = color_score(oil_contamination) *
    OilQuality.where('name = ?', 'color').first.weight.to_i
    (dielectric_breakdown_score_times_weight + ift_score_times_weight + nn_score_times_weight +
     water_content_score_times_weight + color_score_times_weight).to_f
  end


  def power_factor_score(insulating_oil, degrees)
    name, value = case degrees
    when :twenty_degrees
      ['pf_20c', insulating_oil.avg_percent_power_factor_maintank]
    when :hundred_degrees
      ['pf_100c', insulating_oil.cor_percent_power_factor_maintank]
    end
    OilQuality.where('name = ?', name).each do |oil_quality|
      oil_quality.start = 0 if oil_quality.start.nil?
      oil_quality.end = 1000000 if oil_quality.end.nil?
      if (value.round(1).between?(oil_quality.start, oil_quality.end))
        return oil_quality.score
      end
    end
  end

  def color_score(oil_contamination)
    oil_qualities = OilQuality.where('name = ?', 'color')
    oil_qualities.each do |oil_quality|
      oil_quality.start = 0 if oil_quality.start.nil?
      oil_quality.end = 1000000 if oil_quality.end.nil?
      if oil_contamination.color.round(1).between?(oil_quality.start, oil_quality.end)
        return oil_quality.score
      end
    end
  end

  def water_content_score(oil_contamination)
    u = oil_contamination.transformer.hv
    water_content = oil_contamination.water_content
    oil_qualities = OilQuality.where('name = ?', 'water_content')
    oil_qualities.each do |oil_quality|
      oil_quality.u_start = 0 if oil_quality.u_start.nil?
      oil_quality.u_end = 1000000 if oil_quality.u_end.nil?
      oil_quality.start = 0 if oil_quality.start.nil?
      oil_quality.end = 1000000 if oil_quality.end.nil?
      if u.between?(oil_quality.u_start, oil_quality.u_end) &&
          water_content.between?(oil_quality.start, oil_quality.end)
        return oil_quality.score
      end
    end
  end

  def nn_score(oil_contamination)
    u = oil_contamination.transformer.hv
    nn = oil_contamination.nn
    oil_qualities = OilQuality.where(:name => 'nn')
    oil_qualities.each do |oil_quality|
      oil_quality.u_start = 0 if oil_quality.u_start.nil?
      oil_quality.u_end = 1000000 if oil_quality.u_end.nil?
      oil_quality.start = 0 if oil_quality.start.nil?
      oil_quality.end = 1000000 if oil_quality.end.nil?
      if u.between?(oil_quality.u_start, oil_quality.u_end) && nn.round(2).between?(oil_quality.start, oil_quality.end)
        return oil_quality.score
      end
    end
  end

  def ift_score(oil_contamination)
    u = oil_contamination.transformer.hv
    ift = oil_contamination.ift
    oil_qualities = OilQuality.where('name = ?', 'ift')
    oil_qualities.each do |oil_quality|
      oil_quality.u_start = 0 if oil_quality.u_start.nil?
      oil_quality.u_end = 1000000 if oil_quality.u_end.nil?
      oil_quality.start = 0 if oil_quality.start.nil?
      oil_quality.end = 1000000 if oil_quality.end.nil?
      if u.between?(oil_quality.u_start, oil_quality.u_end) && ift.between?(oil_quality.start, oil_quality.end)
        return oil_quality.score
      end
    end
  end

  def dielectric_breakdown_score(insulating_oil)
    xbar = insulating_oil.xi_average_maintank
    u = insulating_oil.transformer.hv
    oil_qualities = OilQuality.where('name = ?', 'xbar')
    oil_qualities.each do |oil_quality|
      oil_quality.u_start = 0 if oil_quality.u_start.nil?
      oil_quality.u_end = 1000000 if oil_quality.u_end.nil?
      oil_quality.start = 0 if oil_quality.start.nil?
      oil_quality.end = 1000000 if oil_quality.end.nil?
      if (u.between?(oil_quality.u_start, oil_quality.u_end) && xbar.between?(oil_quality.start, oil_quality.end))
        return oil_quality.score
      end
    end
  end

  def denominator
    sum = 0
    ['xbar', 'ift', 'nn', 'water_content', 'color'].each do |field|
      oil_quality = OilQuality.where('name = ?', field).order('score DESC').first
      max_score = oil_quality.score.to_i
      weight = oil_quality.weight.to_i
      sum = sum + (max_score * weight)
    end
    return sum
  end

end
