# == Schema Information
# Schema version: 20110115144540
#
# Table name: visual_inspections
#
#  id             :integer(4)      not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  test_type      :string(255)
#  test_by        :string(255)
#  test_date      :date
#  oltc_counter   :string(255)
#  work_order     :string(255)
#  transformer_id :integer(4)
#

class VisualInspection < ActiveRecord::Base
  has_one :general_condition
  has_one :bushing_condition
  has_one :surge_arrester
  has_one :conservator_tank
  has_one :main_tank
  has_one :hot_line_oil_filter
  has_one :radiator_cooling_system
  has_one :transformer_control_cabinet
  has_one :ngr
  belongs_to :transformer

  accepts_nested_attributes_for :conservator_tank
  accepts_nested_attributes_for :surge_arrester
  accepts_nested_attributes_for :general_condition
  accepts_nested_attributes_for :bushing_condition
  accepts_nested_attributes_for :main_tank
  accepts_nested_attributes_for :hot_line_oil_filter
  accepts_nested_attributes_for :radiator_cooling_system
  accepts_nested_attributes_for :transformer_control_cabinet
  accepts_nested_attributes_for :ngr
  
  #Validations
  validates_presence_of :test_type, :message => "can't be blank"
  validates_presence_of :test_by, :message => "can't be blank"
  validates_presence_of :test_date, :message => "can't be blank"
  validates_presence_of :oltc_counter, :message => "can't be blank"
  validates_presence_of :work_order, :message => "can't be blank"
  validates_presence_of :transformer_id, :message => "can't be blank"
end
