class CreateSystemFaultLevels < ActiveRecord::Migration
  def self.up
    create_table :system_fault_levels do |t|
      t.integer :start
      t.integer :end
      t.integer :score
      t.string :score_message
      t.integer :bus_voltage_id
      t.timestamps
    end
  end

  def self.down
    drop_table :system_fault_levels
  end
end
