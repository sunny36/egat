# == Schema Information
# Schema version: 20100906080424
#
# Table name: public_images
#
#  id            :integer         not null, primary key
#  value         :string(255)
#  score         :integer
#  score_message :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class PublicImage < ActiveRecord::Base
  has_many :transformer_information
  before_save :insert_null_if_empty

  def insert_null_if_empty
    self.value = nil if self.value == ''
  end
  
end
