class CreateBushingTestConditions < ActiveRecord::Migration
  def self.up
    create_table :bushing_test_conditions do |t|
      t.integer :score
      t.string :score_message
      t.string :testing
      t.decimal :start
      t.decimal :end
      t.integer :weight
      t.string :color_id
      t.timestamps
    end
  end

  def self.down
    drop_table :bushing_test_conditions
  end
end
