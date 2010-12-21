class AddTransformerIdToOilDga < ActiveRecord::Migration
  def self.up
    add_column :oil_dgas, :transformer_id, :integer
    
  end

  def self.down
    remove_column :oil_dgas, :transformer_id
  end
end