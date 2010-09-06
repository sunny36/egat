# == Schema Information
# Schema version: 20100906080424
#
# Table name: system_locations
#
#  id            :integer         not null, primary key
#  value         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  score         :integer
#  score_message :string(255)
#

class SystemLocation < ActiveRecord::Base
  has_many :transformer_information


end
