class CreateDgaGasScores < ActiveRecord::Migration
  def self.up
    create_table :dga_gas_scores do |t|
      t.integer :score
      t.string :score_message
      t.integer :start
      t.integer :end
      t.integer :weight
      t.integer :gas_id
      t.timestamps
    end
  end

  def self.down
    drop_table :dga_gas_scores
  end
end
