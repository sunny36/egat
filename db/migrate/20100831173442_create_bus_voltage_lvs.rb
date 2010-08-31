class CreateBusVoltageLvs < ActiveRecord::Migration
  def self.up
    create_table :bus_voltage_lvs do |t|
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :bus_voltage_lvs
  end
end
