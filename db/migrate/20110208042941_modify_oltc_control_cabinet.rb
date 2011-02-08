class ModifyOltcControlCabinet < ActiveRecord::Migration
  def self.up
    remove_column :oltc_control_cabinets, :version
    remove_column :oltc_control_cabinets, :test_by
    remove_column :oltc_control_cabinets, :test_date
    remove_column :oltc_control_cabinets, :work_order
    remove_column :oltc_control_cabinets, :perform_type
    remove_column :oltc_control_cabinets, :transformer
    add_column :oltc_control_cabinets, :visual_inspection_id, :integer
    
  end

  def self.down
    remove_column :oltc_control_cabinets, :visual_inspection_id    
  end
end
