# == Schema Information
# Schema version: 20110111130021
#
# Table name: visual_inspections
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class VisualInspection < ActiveRecord::Base
  has_one :general_condition
  belongs_to :transformer
  
  accepts_nested_attributes_for :general_condition
end
