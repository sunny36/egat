class ChangeWindingIdToWindingTypeId < ActiveRecord::Migration
  def self.up
    rename_column :transformer, :winding_id, :winding_type_id
  end

  def self.down
    rename_column :transformer, :winding_type_id, :winding_id
  end
end
