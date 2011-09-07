class BushingTestCondition < ActiveRecord::Base
  belongs_to :color
end

# == Schema Information
#
# Table name: bushing_test_conditions
#
#  id            :integer(4)      not null, primary key
#  score         :integer(4)
#  score_message :string(255)
#  testing       :string(255)
#  start         :float
#  end           :float
#  weight        :integer(4)
#  color_id      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

