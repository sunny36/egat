class CreateBusVoltages < ActiveRecord::Migration
  def self.up
    create_table :bus_voltages do |t|
      t.integer :start
      t.integer :end
      t.timestamps
    end
  end

  def self.down
    drop_table :bus_voltages
  end
end
