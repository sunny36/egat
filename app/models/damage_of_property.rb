# == Schema Information
# Schema version: 20101205200640
#
# Table name: damage_of_properties
#
#  id         :integer(4)      not null, primary key
#  value      :string(255)
#  message    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class DamageOfProperty < ActiveRecord::Base
  has_and_belongs_to_many :transformer_information
end
