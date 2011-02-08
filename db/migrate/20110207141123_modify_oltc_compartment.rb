class ModifyOltcCompartment < ActiveRecord::Migration
  def self.up
    remove_column :oltc_compartments, :version
    remove_column :oltc_compartments, :test_by
    remove_column :oltc_compartments, :test_date
    remove_column :oltc_compartments, :work_order
    remove_column :oltc_compartments, :perform_type
    remove_column :oltc_compartments, :transformer
    add_column :oltc_compartments, :visual_inspection_id, :integer
    
  end

  def self.down
    remove_column :oltc_compartments, :visual_inspection_id    
  end
end
