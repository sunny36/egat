class RenameThermoScan < ActiveRecord::Migration
  def self.up
    rename_table :thermo_scan, :thermo_scans
  end

  def self.down
    rename_table :thermo_scans, :thermo_scan
  end
end