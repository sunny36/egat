class RemoveVersionFromWindingTypes < ActiveRecord::Migration
  def self.up
    remove_column :winding_types, :version
  end

  def self.down
    add_column :winding_types, :version, :integer
  end
end
