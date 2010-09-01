class AddSystemFaultLevelToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :system_fault_level_hv, :double
    add_column :transformer_informations, :system_fault_level_lv, :double
  end

  def self.down
    remove_column :transformer_informations, :system_fault_level_hv
    remove_column :transformer_informations, :system_fault_level_lv
  end
end