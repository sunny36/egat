# == Schema Information
# Schema version: 20101205200640
#
# Table name: system_locations
#
#  id            :integer(4)      not null, primary key
#  value         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  score         :integer(4)
#  score_message :string(255)
#

class SystemLocation < ActiveRecord::Base
  has_many :transformer_information


end
