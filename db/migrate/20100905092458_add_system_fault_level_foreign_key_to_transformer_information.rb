class AddSystemFaultLevelForeignKeyToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :system_fault_level_id, :integer
  end

  def self.down
    remove_column :transformer_informations, :system_fault_level_id
  end
end