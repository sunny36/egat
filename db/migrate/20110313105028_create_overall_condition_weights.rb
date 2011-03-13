class CreateOverallConditionWeights < ActiveRecord::Migration
  def self.up
    create_table :overall_condition_weights do |t|
      t.string :name
      t.string :text
      t.string :weight      
      t.timestamps
    end
  end

  def self.down
    drop_table :overall_condition_weights
  end
end
