# == Schema Information
# Schema version: 20110215204448
#
# Table name: thermo_scan_factors
#
#  id          :integer(4)      not null, primary key
#  hi_factor   :integer(4)
#  condition   :string(255)
#  load_start  :integer(4)
#  load_end    :integer(4)
#  delta_start :integer(4)
#  delta_end   :integer(4)
#  color       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ThermoScanFactor < ActiveRecord::Base
end
