class ModifyMainTank < ActiveRecord::Migration
  def self.up
    remove_column :main_tanks, :version
    remove_column :main_tanks, :test_by
    remove_column :main_tanks, :test_date
    remove_column :main_tanks, :work_order
    remove_column :main_tanks, :perform_type
    remove_column :main_tanks, :transformer
    add_column :main_tanks, :visual_inspection_id, :integer
  end

  def self.down
    remove_column :main_tanks, :visual_inspection_id
  end
end