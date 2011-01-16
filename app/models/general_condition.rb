# == Schema Information
# Schema version: 20110115144540
#
# Table name: general_conditions
#
#  id                   :integer(4)      not null, primary key
#  test_by              :string(255)
#  test_date            :datetime
#  work_order           :string(255)
#  animal_protect       :integer(10)
#  foundation           :integer(10)
#  ground_connector     :integer(10)
#  maxload              :integer(10)
#  perform_type         :integer(10)
#  sound                :integer(10)
#  transformer_id       :integer(10)
#  vibration            :integer(10)
#  visual_inspection_id :integer(4)
#

class GeneralCondition < ActiveRecord::Base
  belongs_to :transformer
  belongs_to :visual_inspection
  
  
end
