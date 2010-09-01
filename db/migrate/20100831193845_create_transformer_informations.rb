class CreateTransformerInformations < ActiveRecord::Migration
  def self.up
    create_table :transformer_informations do |t|
      t.integer :bus_voltage_hv_id
      t.integer :bus_voltage_lv_id
      t.timestamps
    end
  end

  def self.down
    drop_table :transformer_informations
  end
end
