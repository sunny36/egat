# == Schema Information
# Schema version: 20110208051447
#
# Table name: thermo_scans
#
#  id                   :integer(4)      not null, primary key
#  delt                 :float
#  load                 :float
#  visual_inspection_id :integer(4)
#

class ThermoScan < ActiveRecord::Base
  belongs_to :visual_inspection
end
