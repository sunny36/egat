class BusVoltage < ActiveRecord::Base
  has_many :system_fault_level
end
