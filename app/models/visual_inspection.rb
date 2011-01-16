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
  belongs_to :transformer
  
  accepts_nested_attributes_for :general_condition
end
