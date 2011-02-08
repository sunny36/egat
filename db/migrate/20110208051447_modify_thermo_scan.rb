class ModifyThermoScan < ActiveRecord::Migration
  def self.up
    remove_column :thermo_scans, :version
    remove_column :thermo_scans, :test_by
    remove_column :thermo_scans, :test_date
    remove_column :thermo_scans, :work_order
    remove_column :thermo_scans, :perform_type
    remove_column :thermo_scans, :transformer
    add_column :thermo_scans, :visual_inspection_id, :integer
  end

  def self.down
    remove_column :thermo_scans, :visual_inspection_id
  end
end
