class AddRecentToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :recent, :boolean
  end

  def self.down
    remove_column :transformer_informations, :recent
  end
end