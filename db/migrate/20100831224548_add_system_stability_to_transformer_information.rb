class AddSystemStabilityToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :system_stability_id, :integer
  end

  def self.down
    remove_column :transformer_informations, :system_stability_id
  end
end