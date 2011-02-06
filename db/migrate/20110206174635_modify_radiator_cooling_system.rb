class ModifyRadiatorCoolingSystem < ActiveRecord::Migration
  def self.up
    remove_column :radiator_cooling_systems, :version
    remove_column :radiator_cooling_systems, :test_by
    remove_column :radiator_cooling_systems, :test_date
    remove_column :radiator_cooling_systems, :work_order
    remove_column :radiator_cooling_systems, :perform_type
    remove_column :radiator_cooling_systems, :transformer
    add_column :radiator_cooling_systems, :visual_inspection_id, :integer
    
  end

  def self.down
    remove_column :radiator_cooling_systems, :visual_inspection_id
  end
end
