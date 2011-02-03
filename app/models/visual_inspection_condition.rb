# == Schema Information
# Schema version: 20110203165120
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
#  weight               :integer(4)
#  visual_inspection_id :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#

class VisualInspectionCondition < ActiveRecord::Base

  def self.weight(field_name, table_name)
    self.where("name = ? AND table_name = ?", field_name.to_s, table_name.to_s).
    first.weight.to_i
  end
  
  def self.max_score(field_name, table_name)
    self.where("name = ? AND table_name = ?", field_name.to_s, table_name.to_s).
    order("score DESC").first.score.to_i
  end
end
