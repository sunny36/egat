class CreateOilDgas < ActiveRecord::Migration
  def self.up
    create_table :oil_dgas do |t|
      t.string :test_type
      t.date :test_date
      t.string :work_order
      t.integer :co2
      t.integer :co2_score
      t.integer :co
      t.integer :co_score
      t.integer :h2
      t.integer :h2_score
      t.integer :ch4
      t.integer :ch4_score
      t.integer :c2h2
      t.integer :c2h2_score
      t.integer :c2h4
      t.integer :c2h4_score
      t.integer :c4h6
      t.integer :c4h6_score

      t.timestamps
    end
  end

  def self.down
    drop_table :oil_dgas
  end
end
