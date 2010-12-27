# == Schema Information
# Schema version: 20101205200640
#
# Table name: bus_voltage_lvs
#
#  id         :integer(4)      not null, primary key
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class BusVoltageLv < ActiveRecord::Base
  has_many :transformer_information
end
