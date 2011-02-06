class ModifyNgrTable2 < ActiveRecord::Migration
  def self.up
    remove_column :ngrs, :version
    remove_column :ngrs, :test_by
    remove_column :ngrs, :test_date
    remove_column :ngrs, :work_order
    remove_column :ngrs, :perform_type
    remove_column :ngrs, :transformer
    add_column :ngrs, :visual_inspection_id, :integer
    
  end

  def self.down
    remove_column :ngrs, :visual_inspection_id    
  end
end
