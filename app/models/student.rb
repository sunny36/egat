# == Schema Information
# Schema version: 20101205200640
#
# Table name: students
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Student < ActiveRecord::Base
end
