class CreateBusVoltageHvs < ActiveRecord::Migration
  def self.up
    create_table :bus_voltage_hvs do |t|
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :bus_voltage_hvs
  end
end
