class CreateArresterConditions < ActiveRecord::Migration
  def self.up
    create_table :arrester_conditions do |t|
      t.integer :score
      t.string :score_message
      t.string :testing
      t.float :start
      t.float :end
      t.integer :weight
      t.string :color_id
      t.timestamps
    end
  end

  def self.down
    drop_table :arrester_conditions
  end
end
