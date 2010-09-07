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
  has_many :transformer_information
  
  def self.system_fault_level(bus_voltage)
    @bus_voltages = self.find(:all, :order => "start")
    @bus_voltages.each do |i|
      i.end = 1000 if i.end.nil?
      if bus_voltage.between?(i.start, i.end)
        return i.system_fault_level
      end
    end
  end
end
