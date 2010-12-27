# == Schema Information
# Schema version: 20101205200640
#
# Table name: bus_voltage_hvs
#
#  id         :integer(4)      not null, primary key
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class BusVoltageHv < ActiveRecord::Base
  has_many :transformer_information
end
