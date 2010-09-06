# == Schema Information
# Schema version: 20100906080424
#
# Table name: students
#
#  id         :integer         primary key
#  name       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

class Student < ActiveRecord::Base
end
