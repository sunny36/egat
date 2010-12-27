# == Schema Information
# Schema version: 20101205200640
#
# Table name: probability_of_force_outages
#
#  id            :integer(4)      not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  score         :integer(4)
#  score_message :string(255)
#  start         :integer(4)
#  end           :integer(4)
#

class ProbabilityOfForceOutage < ActiveRecord::Base
  has_many :transformer_information
  before_save :insert_null_if_empty

  def insert_null_if_empty
    self.value = nil if self.value == ''
  end
  
end
