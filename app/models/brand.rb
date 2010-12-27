# == Schema Information
# Schema version: 20101205200640
#
# Table name: brands
#
#  id            :integer(4)      not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  name          :string(255)
#  score         :integer(4)
#  score_message :string(255)
#

class Brand < ActiveRecord::Base
  has_many :transformer
end
