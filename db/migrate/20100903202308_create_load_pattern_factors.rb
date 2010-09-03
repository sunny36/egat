class CreateLoadPatternFactors < ActiveRecord::Migration
  def self.up
    create_table :load_pattern_factors do |t|
      t.integer :start
      t.integer :end
      t.integer :score
      t.string :score_message      
      t.timestamps
    end
  end

  def self.down
    drop_table :load_pattern_factors
  end
end
