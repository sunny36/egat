# == Schema Information
# Schema version: 20100906080424
#
# Table name: bus_voltages
#
#  id         :integer         not null, primary key
#  start      :integer
#  end        :integer
#  created_at :datetime
#  updated_at :datetime
#

class BusVoltage < ActiveRecord::Base
  has_many :system_fault_level
end
