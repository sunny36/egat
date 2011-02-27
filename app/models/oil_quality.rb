class OilQuality < ActiveRecord::Base
  belongs_to :color

  def hi_factor(insulating_oil, oil_contamination)
    return nil if insulating_oil.blank? || oil_contamination.blank?
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

  def hi_factor_color(insulating_oil, oil_contamination)
    return nil if insulating_oil.blank? || oil_contamination.blank?
    OilQualityFactor.where('hi_factor = ?', hi_factor(insulating_oil, oil_contamination)).first.color.value
  end

  def test_date(insulating_oil, oil_contamination)
    return nil if insulating_oil.blank? || oil_contamination.blank?
    "#{insulating_oil.thai_test_date}, #{oil_contamination.thai_test_date}(BD)"
  end
  
  def percent_oil_quality_factor(insulating_oil, oil_contamination)
    return nil if insulating_oil.blank? || oil_contamination.blank?
    (numerator(insulating_oil, oil_contamination).to_f / denominator.to_f) * 100
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

  def color_score(oil_contamination)
    oil_qualities = OilQuality.where('name = ?', 'color')
    oil_qualities.each do |oil_quality|
      oil_quality.start = 0 if oil_quality.start.nil?
      oil_quality.end = 1000000 if oil_quality.start.nil?
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
      oil_quality.end = 1000000 if oil_quality.start.nil?
      if u.between?(oil_quality.u_start, oil_quality.u_end) && water_content.between?(oil_quality.start, oil_quality.end)
        return oil_quality.score
      end
    end
  end

  def nn_score(oil_contamination)
    u = oil_contamination.transformer.hv
    nn = oil_contamination.nn
    oil_qualities = OilQuality.where('name = ?', 'nn')
    oil_qualities.each do |oil_quality|
      oil_quality.u_start = 0 if oil_quality.u_start.nil?
      oil_quality.u_end = 1000000 if oil_quality.u_end.nil?
      oil_quality.start = 0 if oil_quality.start.nil?
      oil_quality.end = 1000000 if oil_quality.start.nil?
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
      oil_quality.end = 1000000 if oil_quality.start.nil?
      if u.between?(oil_quality.u_start, oil_quality.u_end) && ift.between?(oil_quality.start, oil_quality.end)
        return oil_quality.score
      end
    end
  end

  def dielectric_breakdown_score(insulating_oil)
    xbar = insulating_oil.xi_average_maintank
    u = insulating_oil.transformer.hv
    oil_qualities = OltcOilQuality.where('name = ?', 'xbar')
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
