class AddPositionToTransformer < ActiveRecord::Migration
  def self.up
    add_column :transformer, :position, :string
  end

  def self.down
    remove_column :transformer, :position
  end
end