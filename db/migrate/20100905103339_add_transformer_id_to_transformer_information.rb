class AddTransformerIdToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :transformer_id, :integer
  end

  def self.down
    remove_column :transformer_informations, :transformer_id
  end
end