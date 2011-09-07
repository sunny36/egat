class CreateArresters < ActiveRecord::Migration
  def self.up
    create_table :arresters do |t|
      t.string :h1_serial_number
      t.decimal :h1_test_kv, :precision => 10, :scale => 2
      t.decimal :h1_current, :precision => 10, :scale => 2
      t.decimal :h1_watt, :precision => 10, :scale => 2
      t.decimal :h1_insulation_resistance, :precision => 10, :scale => 2
      t.decimal :h1_leakage_current, :precision => 10, :scale => 2
      t.string :h2_serial_number
      t.decimal :h2_test_kv, :precision => 10, :scale => 2
      t.decimal :h2_current, :precision => 10, :scale => 2
      t.decimal :h2_watt, :precision => 10, :scale => 2
      t.decimal :h2_insulation_resistance, :precision => 10, :scale => 2
      t.decimal :h2_leakage_current, :precision => 10, :scale => 2
      t.string :h3_serial_number
      t.decimal :h3_test_kv, :precision => 10, :scale => 2
      t.decimal :h3_current, :precision => 10, :scale => 2
      t.decimal :h3_watt, :precision => 10, :scale => 2
      t.decimal :h3_insulation_resistance, :precision => 10, :scale => 2
      t.decimal :h3_leakage_current, :precision => 10, :scale => 2
      t.string :x1_serial_number
      t.decimal :x1_test_kv, :precision => 10, :scale => 2
      t.decimal :x1_current, :precision => 10, :scale => 2
      t.decimal :x1_watt, :precision => 10, :scale => 2
      t.decimal :x1_insulation_resistance, :precision => 10, :scale => 2
      t.decimal :x1_leakage_current, :precision => 10, :scale => 2
      t.string :x2_serial_number
      t.decimal :x2_test_kv, :precision => 10, :scale => 2
      t.decimal :x2_current, :precision => 10, :scale => 2
      t.decimal :x2_watt, :precision => 10, :scale => 2
      t.decimal :x2_insulation_resistance, :precision => 10, :scale => 2
      t.decimal :x2_leakage_current, :precision => 10, :scale => 2
      t.string :x3_serial_number
      t.decimal :x3_test_kv, :precision => 10, :scale => 2
      t.decimal :x3_current, :precision => 10, :scale => 2
      t.decimal :x3_watt, :precision => 10, :scale => 2
      t.decimal :x3_insulation_resistance, :precision => 10, :scale => 2
      t.decimal :x3_leakage_current, :precision => 10, :scale => 2
      t.string :y1_serial_number
      t.decimal :y1_test_kv, :precision => 10, :scale => 2
      t.decimal :y1_current, :precision => 10, :scale => 2
      t.decimal :y1_watt, :precision => 10, :scale => 2
      t.decimal :y1_insulation_resistance, :precision => 10, :scale => 2
      t.decimal :y1_leakage_current, :precision => 10, :scale => 2
      t.string :y2_serial_number
      t.decimal :y2_test_kv, :precision => 10, :scale => 2
      t.decimal :y2_current, :precision => 10, :scale => 2
      t.decimal :y2_watt, :precision => 10, :scale => 2
      t.decimal :y2_insulation_resistance, :precision => 10, :scale => 2
      t.decimal :y2_leakage_current, :precision => 10, :scale => 2
      t.string :y3_serial_number
      t.decimal :y3_test_kv, :precision => 10, :scale => 2
      t.decimal :y3_current, :precision => 10, :scale => 2
      t.decimal :y3_watt, :precision => 10, :scale => 2
      t.decimal :y3_insulation_resistance, :precision => 10, :scale => 2
      t.decimal :y3_leakage_current, :precision => 10, :scale => 2
      t.integer :transformer_id
      t.string :test_type
      t.date :test_date
      t.string :work_order
      t.timestamps
    end
  end

  def self.down
    drop_table :arresters
  end
end
