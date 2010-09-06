class AddBusVoltageForeignKeyToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :bus_voltage_id, :integer
  end

  def self.down
    remove_column :transformer_informations, :bus_voltage_id
  end
end