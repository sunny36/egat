# == Schema Information
# Schema version: 20101205200640
#
# Table name: system_fault_levels
#
#  id             :integer(4)      not null, primary key
#  start          :integer(4)
#  end            :integer(4)
#  score          :integer(4)
#  score_message  :string(255)
#  bus_voltage_id :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#

class SystemFaultLevel < ActiveRecord::Base
  belongs_to :bus_voltage
  has_one :transformer_information
  before_save :insert_null_if_empty
  
  def insert_null_if_empty
    self.start = nil if self.start == ''
    self.end = nil if self.start == ''
  end
end
