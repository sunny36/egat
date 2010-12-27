# == Schema Information
# Schema version: 20101205200640
#
# Table name: pollutions
#
#  id            :integer(4)      not null, primary key
#  value         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  score         :integer(4)
#  score_message :string(255)
#

class Pollution < ActiveRecord::Base
  has_many :pollution
  before_save :insert_null_if_empty

  def insert_null_if_empty
    self.value = nil if self.value == ''
  end
  
end
