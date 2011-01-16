# == Schema Information
# Schema version: 20110115144540
#
# Table name: visual_inspection_conditions
#
#  id                   :integer(4)      not null, primary key
#  description          :string(255)
#  start                :integer(4)
#  end                  :integer(4)
#  condition            :string(255)
#  name                 :string(255)
#  table_name           :string(255)
#  score                :integer(4)
#  score_message        :string(255)
#  visual_inspection_id :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#

class VisualInspectionCondition < ActiveRecord::Base
end
