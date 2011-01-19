class ModifyWindingType < ActiveRecord::Migration
  def self.up
    rename_table :winding_type, :winding_types
  end

  def self.down
    rename_table :winding_types, :winding_type 
  end
end
