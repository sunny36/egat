# == Schema Information
# Schema version: 20100906162356
#
# Table name: transformer_informations
#
#  id                             :integer         not null, primary key
#  bus_voltage_hv_id              :integer
#  bus_voltage_lv_id              :integer
#  created_at                     :datetime
#  updated_at                     :datetime
#  system_fault_level_hv          :float
#  system_fault_level_lv          :float
#  probability_of_force_outage_id :integer
#  social_aspect_id               :integer
#  system_location_id             :integer
#  application_use_id             :integer
#  system_stability_id            :integer
#  pollution_id                   :integer
#  n1_criteria_id                 :integer
#  public_image_id                :integer
#  system_fault_level_id          :integer
#  transformer_id                 :integer
#  recorded_date                  :date
#  bus_voltage_id                 :integer
#

class TransformerInformation < ActiveRecord::Base
  belongs_to :bus_voltage_hv
  belongs_to :bus_voltage_lv
  belongs_to :probability_of_force_outage
  belongs_to :social_aspect, :class_name => "SocialAspect", 
    :foreign_key => "social_aspect_id"
  belongs_to :system_location, :class_name => "SystemLocation", 
    :foreign_key => "system_location_id"
  belongs_to :application_use, :class_name => "ApplicationUse", 
    :foreign_key => "application_use_id"
  belongs_to :system_stability, :class_name => "SystemStability", 
    :foreign_key => "system_stability_id"
  belongs_to :pollution, :class_name => "Pollution", 
    :foreign_key => "pollution_id"
  belongs_to :n1_criteria, :class_name => "N1Criteria", 
    :foreign_key => "n1_criteria_id"
  belongs_to :public_image, :class_name => "PublicImage", 
    :foreign_key => "public_image_id"
  belongs_to :system_fault_level, :class_name => "SystemFaultLevel", 
    :foreign_key => "system_fault_level_id"
  belongs_to :transformer, :class_name => "Transformer", 
    :foreign_key => "transformer_id"
  has_one :load_pattern_per_year
  has_and_belongs_to_many :damage_of_properties
  belongs_to :bus_voltage
  attr_accessor :system_fault_level_hv_mva, :system_fault_level_lv_mva, 
    :transformer_name

  accepts_nested_attributes_for :load_pattern_per_year
  
  validate :transformer_name_must_be_valid,
           :at_least_one_damage_of_property_must_be_checked
  validates_presence_of :recorded_date, :bus_voltage_hv_id, 
                        :system_fault_level_hv, :bus_voltage_lv_id, 
                        :system_fault_level_lv, :probability_of_force_outage_id,
                        :social_aspect_id, :system_location_id, 
                        :public_image_id, :n1_criteria_id, :application_use_id,
                        :system_stability_id, :pollution_id
  validates_numericality_of :system_fault_level_hv, :system_fault_level_lv
  
  def self.get_data_points 
    points = []
    transformer_informations = self.find(:all, :order => "id")
    transformer_informations.each { |e| 
      points << [e.transformer.transformer_name,  e.importance_index, e.percent_hi]
    }
    return points 
  end

  def system_fault_level_score
    [system_fault_level_lv_score, system_fault_level_hv_score].max
  end
  
  def damage_of_property_score
    value = []
    self.damage_of_properties.each do |i|
      value << i.value.to_i
    end
    very_low = [1, 2, 3, 4]
    low = [[1,4], [3,4], [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
    moderate = [[1], [3], [4], [1, 2], [3, 2], [4, 2], [1,3]]
    high = [2]
    very_high = [5]
    @score = 0
    @score = 1 if (value - very_low).empty?
    low.each do |i|
      @score = 2 if (value - i).empty?
    end
    moderate.each do |i|
      @score = 3 if (value - i).empty?
    end
    @score = 4 if (value - high).empty?
    @score = 5 if (value - very_high).empty?
    return @score
  end
  
  def importance_index    
    (((load_pattern_per_year.load_pattern_factor.score * 4) + 
      (system_location.score * 4) + (n1_criteria.score * 5) + 
      (system_stability.score * 4) + (application_use.score * 4)  + 
      (system_fault_level_score * 4) + (probability_of_force_outage.score * 4) + 
      (damage_of_property_score * 3) + (social_aspect.score * 3) + 
      (public_image.score * 1) + (pollution.score * 1) + 
      (transformer.brand.score * 2)).to_f / 
     ((5 * 4) + (6 * 4) + (5 * 5) + (5 * 4) + (4 * 3) + (5 * 4) + (5 * 4) +
      (5 * 3) + (5 * 3) + (5 * 1) + (4 * 1) + (5 * 2)).to_f * 100.to_f )    
  end
  
  def percent_hi
    rand * 100
  end
  
  protected
  
  def system_fault_level_hv_mva
    return nil if bus_voltage_hv.nil? || system_fault_level_hv.nil?
    1.732 * bus_voltage_hv.value.to_f * system_fault_level_hv.to_f
  end
  
  def system_fault_level_lv_mva
    return nil if bus_voltage_lv.nil? || system_fault_level_lv.nil?
    1.732 * bus_voltage_lv.value.to_f * system_fault_level_lv.to_f
  end
  
  def transformer_name_must_be_valid
    @transformer = Transformer.find(transformer_id)
    errors.add_to_base('Please select a valid transformer') if @transformer.nil?
  end
  
  def at_least_one_damage_of_property_must_be_checked
    errors.add(:damage_of_properties, 'must have at least one checkbox ticked') if damage_of_property_ids.nil? || damage_of_property_ids.empty? 
  end

  
  def system_fault_level_hv_score
    @system_fault_levels = BusVoltage.system_fault_level(self.bus_voltage_hv.value.to_i)
    @system_fault_levels.each do |i|
      i.end = 100000000 if i.end.nil?
      if system_fault_level_hv_mva.between?(i.start, i.end)
        return i.score
      end
    end
  end

  def system_fault_level_lv_score
    @system_fault_levels = BusVoltage.system_fault_level(self.bus_voltage_lv.value.to_i)
    @system_fault_levels.each do |i|
      i.end = 100000000 if i.end.nil?
      if system_fault_level_lv_mva.between?(i.start, i.end)
        return i.score
      end
    end
  end  
end
