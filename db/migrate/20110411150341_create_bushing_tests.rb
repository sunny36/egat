class CreateBushingTests < ActiveRecord::Migration
  def self.up
    create_table :bushing_tests do |t|
      t.string :h1_c1_serial_number
      t.integer :h1_c1_test_kv
      
      t.timestamps
    end
  end

  def self.down
    drop_table :bushing_tests
  end
end
