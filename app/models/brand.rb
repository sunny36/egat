# == Schema Information
# Schema version: 20100906080424
#
# Table name: brands
#
#  id            :integer         primary key
#  created_at    :timestamp
#  updated_at    :timestamp
#  name          :string(255)
#  score         :integer
#  score_message :string(255)
#

class Brand < ActiveRecord::Base
  has_many :transformer
end
