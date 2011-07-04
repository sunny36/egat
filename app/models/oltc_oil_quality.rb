class OltcOilQuality < ActiveRecord::Base
  belongs_to :color


  def self.find_all_by_name_and_transformer(name, transformer)
    if name == 'water_content' || name == 'color'
      return OltcOilQuality.where(:name => name)
    end
    u = transformer.hv
    oltc_oil_qualities = OltcOilQuality.where(:name => name)
    ids = Array.new
    oltc_oil_qualities.each do |oltc_oil_quality|
      oltc_oil_quality.u_start = 0 if oltc_oil_quality.u_start.nil?
      oltc_oil_quality.u_end = 1000000 if oltc_oil_quality.u_end.nil?
      if u.between?(oltc_oil_quality.u_start, oltc_oil_quality.u_end)
        ids << oltc_oil_quality.id
      end
    end
    oltc_oil_qualities.where(:id => ids) 
  end

  def hi_factor(insulating_oil, oltc_oil_contamination, type)
    return nil if insulating_oil.blank? || oltc_oil_contamination.blank?
    if type == :oltc_oil_quality
      OltcOilQualityFactor.all.each do |oltc_oil_quality_factor|
        oltc_oil_quality_factor.start = 0 if oltc_oil_quality_factor.start.nil?
        oltc_oil_quality_factor.end = 1000000 if oltc_oil_quality_factor.end.nil?
        condition = percent_oltc_oil_quality_factor(insulating_oil, oltc_oil_contamination).
                      between?(oltc_oil_quality_factor.start, oltc_oil_quality_factor.end)
        if condition
          return oltc_oil_quality_factor.hi_factor
        end
      end
    end
    if type == :oltc_oil_contamination
      OltcOilContaminationFactor.all.each do |oltc_oil_contamination_factor|
        oltc_oil_contamination_factor.start = 0 if oltc_oil_contamination_factor.start.nil?
        oltc_oil_contamination_factor.end = 1000000 if oltc_oil_contamination_factor.end.nil?
        condition = percent_oltc_oil_contamination_factor(insulating_oil, oltc_oil_contamination).round.between?(oltc_oil_contamination_factor.start, oltc_oil_contamination_factor.end)                      
        if condition
          return oltc_oil_contamination_factor.hi_factor
        end
      end
    end
    if type == :oltc_dielectric_property
      OltcDielectricPropertyFactor.all.each do |oltc_dielectric_property_factor|
        oltc_dielectric_property_factor.start = 0 if oltc_dielectric_property_factor.start.nil?
        oltc_dielectric_property_factor.end = 1000000 if oltc_dielectric_property_factor.end.nil?
        if percent_oltc_dielectric_property_factor(insulating_oil,).round.between?(oltc_dielectric_property_factor.start, oltc_dielectric_property_factor.end)
          return oltc_dielectric_property_factor.hi_factor
        end
      end
    end
  end

  
  def hi_factor_color(insulating_oil, oltc_oil_contamination, type)
    return nil if insulating_oil.blank? || oltc_oil_contamination.blank?
    if type == :oltc_oil_quality
      return OltcOilQualityFactor.where('hi_factor = ?', hi_factor(insulating_oil, oltc_oil_contamination, type)).first.color
    end
    if type == :oltc_oil_contamination
      hi_factor = hi_factor(insulating_oil, oltc_oil_contamination, type)
      return OltcOilContaminationFactor.where('hi_factor = ?', hi_factor).first.color.value
    end    
    if type == :oltc_dielectric_property
      hi_factor = hi_factor(insulating_oil, oltc_oil_contamination, type)
      return OltcDielectricPropertyFactor.where('hi_factor = ?', hi_factor).first.color.value
    end
  end
  
  def test_date(insulating_oil, oltc_oil_contamination)
    return nil if insulating_oil.blank? || oltc_oil_contamination.blank?
    "#{oltc_oil_contamination.thai_test_date}, #{insulating_oil.thai_test_date}(BD)"
  end

  def percent_oltc_oil_quality_factor(insulating_oil, oltc_oil_contamination)
    return nil if insulating_oil.blank? || oltc_oil_contamination.blank?
    (numerator(insulating_oil, oltc_oil_contamination).to_f / denominator.to_f) * 100
  end

  def percent_oltc_oil_contamination_factor(insulating_oil, oltc_oil_contamination)
    return nil if insulating_oil.blank? || oltc_oil_contamination.blank?
    _numerator = numerator(insulating_oil, oltc_oil_contamination) - 
                 (dielectric_breakdown_score(insulating_oil) * 
                  OltcOilQuality.where('name = ?', 'xbar').first.weight.to_i)
    _denominator = denominator - 
                  (OltcOilQuality.where('name = ?', 'xbar').order('score DESC').first.score.to_i * 
                   OltcOilQuality.where('name = ?', 'xbar').order('score DESC').first.weight.to_i)
    (_numerator.to_f / _denominator.to_f) * 100
  end
  
  def percent_oltc_dielectric_property_factor(insulating_oil)
    return nil if insulating_oil.blank?
    _numerator = (dielectric_breakdown_score(insulating_oil) * 
                  OltcOilQuality.where('name = ?', 'xbar').first.weight.to_i) +
                 (cor_percent_power_factor_oltc_score(insulating_oil) * 
                 OltcOilQuality.where('name = ?', 'pf_20c').first.weight.to_i)
    _denominator = (OltcOilQuality.where('name = ?', 'xbar').order('score DESC').first.score.to_i * 
                    OltcOilQuality.where('name = ?', 'xbar').order('score DESC').first.weight.to_i) + 
                   (OltcOilQuality.where('name = ?', 'pf_20c').order('score DESC').first.score.to_i * 
                    OltcOilQuality.where('name = ?', 'pf_20c').order('score DESC').first.weight.to_i)
    return (_numerator.to_f / _denominator.to_f) * 100.0
  end
  
  def numerator(insulating_oil, oltc_oil_contamination)
    dielectric_breakdown_score_times_weight = dielectric_breakdown_score(insulating_oil) *
      OltcOilQuality.where('name = ?', 'xbar').first.weight.to_i
    water_content_score_times_weight = water_content_score(oltc_oil_contamination) *
      OltcOilQuality.where('name = ?', 'water_content').first.weight.to_i
    color_score_times_weight = color_score(oltc_oil_contamination) *
      OltcOilQuality.where('name = ?', 'color').first.weight.to_i
    (dielectric_breakdown_score_times_weight + water_content_score_times_weight + color_score_times_weight).to_f
  end

  def color_score(oltc_oil_contamination)
    oltc_oil_qualities = OltcOilQuality.where('name = ?', 'color')
    oltc_oil_qualities.each do |oltc_oil_quality|
      oltc_oil_quality.start = 0 if oltc_oil_quality.start.nil?
      oltc_oil_quality.end = 1000000 if oltc_oil_quality.end.nil?
      if oltc_oil_contamination.color.round(1).between?(oltc_oil_quality.start, oltc_oil_quality.end)
        return oltc_oil_quality.score
      end
    end
  end


  def water_content_score(oltc_oil_contamination)
    oltc_oil_qualities = OltcOilQuality.where('name = ?', 'water_content')
    oltc_oil_qualities.each do |oltc_oil_quality|
      oltc_oil_quality.start = 0 if oltc_oil_quality.start.nil?
      oltc_oil_quality.end = 1000000 if oltc_oil_quality.start.nil?
      if oltc_oil_contamination.water_content.between?(oltc_oil_quality.start, oltc_oil_quality.end)
        return oltc_oil_quality.score
      end
    end
  end

  def dielectric_breakdown_score(insulating_oil)
    xbar = insulating_oil.xi_average_oltc
    u = insulating_oil.transformer.hv
    oltc_oil_qualities = OltcOilQuality.where('name = ?', 'xbar')
    oltc_oil_qualities.each do |oltc_oil_quality|
      oltc_oil_quality.start = 0 if oltc_oil_quality.start.nil?
      oltc_oil_quality.end = 1000000 if oltc_oil_quality.end.nil?
      if (u.between?(oltc_oil_quality.u_start, oltc_oil_quality.u_end) &&
          xbar.between?(oltc_oil_quality.start, oltc_oil_quality.end))
        return oltc_oil_quality.score
      end
    end
  end
  
  def cor_percent_power_factor_oltc_score(insulating_oil)
    cor_percent_power_factor_oltc = insulating_oil.cor_percent_power_factor_oltc
    oltc_oil_qualities = OltcOilQuality.where('name = ?', 'pf_20c')
    oltc_oil_qualities.each do |oltc_oil_quality|
      oltc_oil_quality.start = 0 if oltc_oil_quality.start.nil?
      oltc_oil_quality.end = 1000000 if oltc_oil_quality.end.nil?
      if cor_percent_power_factor_oltc.between?(oltc_oil_quality.start, oltc_oil_quality.end)
        return oltc_oil_quality.score
      end
    end
  end

  def denominator
    sum = 0
    ['xbar', 'water_content', 'color'].each do |field|
      oltc_oil_quality = OltcOilQuality.where('name = ?', field).order('score DESC').first
      max_score = oltc_oil_quality.score.to_i
      weight = oltc_oil_quality.weight.to_i
      sum = sum + (max_score * weight)
    end
    return sum
  end

end

# == Schema Information
#
# Table name: oltc_oil_qualities
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  u_start    :integer(4)
#  u_end      :integer(4)
#  start      :float
#  end        :float
#  score      :integer(4)
#  weight     :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  color_id   :integer(4)
#

