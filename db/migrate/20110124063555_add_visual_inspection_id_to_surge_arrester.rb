class AddVisualInspectionIdToSurgeArrester < ActiveRecord::Migration
  def self.up
    add_column :surge_arresters, :visual_inspection_id, :integer
  end

  def self.down
    remove_column :surge_arresters, :visual_inspection_id
  end
end