# == Schema Information
# Schema version: 20101205200640
#
# Table name: n1_criterias
#
#  id            :integer(4)      not null, primary key
#  value         :string(255)
#  score         :integer(4)
#  score_message :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class N1Criteria < ActiveRecord::Base
  has_many :transformer_information
  before_save :insert_null_if_empty

  def insert_null_if_empty
    self.value = nil if self.value == ''
  end
  
end
