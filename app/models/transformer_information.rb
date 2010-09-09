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

  validate :transformer_name_must_be_valid

  def system_fault_level_score
    [system_fault_level_lv_score, system_fault_level_hv_score].max
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
    @transformer = Transformer.find_by_transformer_name(transformer_name)
    errors.add_to_base('Please select a valid transformer') if @transformer.nil?
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
