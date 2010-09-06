# == Schema Information
# Schema version: 20100906080424
#
# Table name: bus_voltage_lvs
#
#  id         :integer         not null, primary key
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class BusVoltageLv < ActiveRecord::Base
  has_many :transformer_information
end
