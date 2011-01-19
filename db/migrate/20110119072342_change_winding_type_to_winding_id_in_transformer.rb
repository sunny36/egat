class ChangeWindingTypeToWindingIdInTransformer < ActiveRecord::Migration
  def self.up
    rename_column :transformer, :winding_type, :winding_id
  end

  def self.down
    rename_column :transformer, :winding_id, :winding_type
  end
end
