class CreateBushingTests < ActiveRecord::Migration
  def self.up
    create_table :bushing_tests do |t|

      t.integer :transformer_id
      t.string :test_type
      t.date :test_date
      t.string :work_order
      t.string :h1_c1_serial_number
      t.integer :h1_c1_test_kv
      t.decimal :h1_c1_current, :precision => 10, :scale => 2
      t.decimal :h1_c1_watt, :precision => 10, :scale => 2
      t.decimal :h1_c1_capacitance, :precision => 10, :scale => 2
      t.string :h1_c1_remark
      t.string :h1_c2_serial_number
      t.integer :h1_c2_test_kv
      t.decimal :h1_c2_current, :precision => 10, :scale => 2
      t.decimal :h1_c2_watt, :precision => 10, :scale => 2
      t.decimal :h1_c2_capacitance, :precision => 10, :scale => 2
      t.string :h1_c2_remark

      t.string :h2_c1_serial_number
      t.integer :h2_c1_test_kv
      t.decimal :h2_c1_current, :precision => 10, :scale => 2
      t.decimal :h2_c1_watt, :precision => 10, :scale => 2
      t.decimal :h2_c1_capacitance, :precision => 10, :scale => 2
      t.string :h2_c1_remark
      t.string :h2_c2_serial_number
      t.integer :h2_c2_test_kv
      t.decimal :h2_c2_current, :precision => 10, :scale => 2
      t.decimal :h2_c2_watt, :precision => 10, :scale => 2
      t.decimal :h2_c2_capacitance, :precision => 10, :scale => 2
      t.string :h2_c2_remark

      t.string :h3_c1_serial_number
      t.integer :h3_c1_test_kv
      t.decimal :h3_c1_current, :precision => 10, :scale => 2
      t.decimal :h3_c1_watt, :precision => 10, :scale => 2
      t.decimal :h3_c1_capacitance, :precision => 10, :scale => 2
      t.string :h3_c1_remark
      t.string :h3_c2_serial_number
      t.integer :h3_c2_test_kv
      t.decimal :h3_c2_current, :precision => 10, :scale => 2
      t.decimal :h3_c2_watt, :precision => 10, :scale => 2
      t.decimal :h3_c2_capacitance, :precision => 10, :scale => 2
      t.string :h3_c2_remark

      t.string :h0_c1_serial_number
      t.integer :h0_c1_test_kv
      t.decimal :h0_c1_current, :precision => 10, :scale => 2
      t.decimal :h0_c1_watt, :precision => 10, :scale => 2
      t.decimal :h0_c1_capacitance, :precision => 10, :scale => 2
      t.string :h0_c1_remark
      t.string :h0_c2_serial_number
      t.integer :h0_c2_test_kv
      t.decimal :h0_c2_current, :precision => 10, :scale => 2
      t.decimal :h0_c2_watt, :precision => 10, :scale => 2
      t.decimal :h0_c2_capacitance, :precision => 10, :scale => 2
      t.string :h0_c2_remark

      # -----------------------------------------------------------------------

      t.string :x1_c1_serial_number
      t.integer :x1_c1_test_kv
      t.decimal :x1_c1_current, :precision => 10, :scale => 2
      t.decimal :x1_c1_watt, :precision => 10, :scale => 2
      t.decimal :x1_c1_capacitance, :precision => 10, :scale => 2
      t.string :x1_c1_remark
      t.string :x1_c2_serial_number
      t.integer :x1_c2_test_kv
      t.decimal :x1_c2_current, :precision => 10, :scale => 2
      t.decimal :x1_c2_watt, :precision => 10, :scale => 2
      t.decimal :x1_c2_capacitance, :precision => 10, :scale => 2
      t.string :x1_c2_remark

      t.string :x2_c1_serial_number
      t.integer :x2_c1_test_kv
      t.decimal :x2_c1_current, :precision => 10, :scale => 2
      t.decimal :x2_c1_watt, :precision => 10, :scale => 2
      t.decimal :x2_c1_capacitance, :precision => 10, :scale => 2
      t.string :x2_c1_remark
      t.string :x2_c2_serial_number
      t.integer :x2_c2_test_kv
      t.decimal :x2_c2_current, :precision => 10, :scale => 2
      t.decimal :x2_c2_watt, :precision => 10, :scale => 2
      t.decimal :x2_c2_capacitance, :precision => 10, :scale => 2
      t.string :x2_c2_remark

      t.string :x3_c1_serial_number
      t.integer :x3_c1_test_kv
      t.decimal :x3_c1_current, :precision => 10, :scale => 2
      t.decimal :x3_c1_watt, :precision => 10, :scale => 2
      t.decimal :x3_c1_capacitance, :precision => 10, :scale => 2
      t.string :x3_c1_remark
      t.string :x3_c2_serial_number
      t.integer :x3_c2_test_kv
      t.decimal :x3_c2_current, :precision => 10, :scale => 2
      t.decimal :x3_c2_watt, :precision => 10, :scale => 2
      t.decimal :x3_c2_capacitance, :precision => 10, :scale => 2
      t.string :x3_c2_remark

      t.string :x0_c1_serial_number
      t.integer :x0_c1_test_kv
      t.decimal :x0_c1_current, :precision => 10, :scale => 2
      t.decimal :x0_c1_watt, :precision => 10, :scale => 2
      t.decimal :x0_c1_capacitance, :precision => 10, :scale => 2
      t.string :x0_c1_remark
      t.string :x0_c2_serial_number
      t.integer :x0_c2_test_kv
      t.decimal :x0_c2_current, :precision => 10, :scale => 2
      t.decimal :x0_c2_watt, :precision => 10, :scale => 2
      t.decimal :x0_c2_capacitance, :precision => 10, :scale => 2
      t.string :x0_c2_remark

      # -----------------------------------------------------------------------

      t.string :y1_c1_serial_number
      t.integer :y1_c1_test_kv
      t.decimal :y1_c1_current, :precision => 10, :scale => 2
      t.decimal :y1_c1_watt, :precision => 10, :scale => 2
      t.decimal :y1_c1_capacitance, :precision => 10, :scale => 2
      t.string :y1_c1_remark
      t.string :y1_c2_serial_number
      t.integer :y1_c2_test_kv
      t.decimal :y1_c2_current, :precision => 10, :scale => 2
      t.decimal :y1_c2_watt, :precision => 10, :scale => 2
      t.decimal :y1_c2_capacitance, :precision => 10, :scale => 2
      t.string :y1_c2_remark

      t.string :y2_c1_serial_number
      t.integer :y2_c1_test_kv
      t.decimal :y2_c1_current, :precision => 10, :scale => 2
      t.decimal :y2_c1_watt, :precision => 10, :scale => 2
      t.decimal :y2_c1_capacitance, :precision => 10, :scale => 2
      t.string :y2_c1_remark
      t.string :y2_c2_serial_number
      t.integer :y2_c2_test_kv
      t.decimal :y2_c2_current, :precision => 10, :scale => 2
      t.decimal :y2_c2_watt, :precision => 10, :scale => 2
      t.decimal :y2_c2_capacitance, :precision => 10, :scale => 2
      t.string :y2_c2_remark

      t.string :y3_c1_serial_number
      t.integer :y3_c1_test_kv
      t.decimal :y3_c1_current, :precision => 10, :scale => 2
      t.decimal :y3_c1_watt, :precision => 10, :scale => 2
      t.decimal :y3_c1_capacitance, :precision => 10, :scale => 2
      t.string :y3_c1_remark
      t.string :y3_c2_serial_number
      t.integer :y3_c2_test_kv
      t.decimal :y3_c2_current, :precision => 10, :scale => 2
      t.decimal :y3_c2_watt, :precision => 10, :scale => 2
      t.decimal :y3_c2_capacitance, :precision => 10, :scale => 2
      t.string :y3_c2_remark

      # -----------------------------------------------------------------------
      t.timestamps
    end

    add_index :bushing_tests, :transformer_id
  end

  def self.down
    remove_index :bushing_tests, :transformer_id
    drop_table :bushing_tests
  end
end