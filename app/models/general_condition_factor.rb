# == Schema Information
# Schema version: 20110203165120
#
# Table name: general_condition_factors
#
#  id         :integer(4)      not null, primary key
#  hi_factor  :integer(4)
#  condition  :string(255)
#  start      :integer(4)
#  end        :integer(4)
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class GeneralConditionFactor < ActiveRecord::Base
end
