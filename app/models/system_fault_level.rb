class SystemFaultLevel < ActiveRecord::Base
  belongs_to :bus_voltage
  has_one :transformer_information
  before_save :insert_null_if_empty
  
  def insert_null_if_empty
    self.start = nil if self.start == ''
    self.end = nil if self.start == ''
  end
end
