class CreateLoadPatternPerYears < ActiveRecord::Migration
  def self.up
    create_table :load_pattern_per_years do |t|
      t.integer :lteq_0_pt_6
      t.integer :gt_0_pt_6_and_lteq_1
      t.integer :gt_1_and_lteq_1_pt_2
      t.integer :gt_1_pt_2_and_lteq_1_pt_5
      t.integer :gt_1_pt_5
      t.timestamps
    end
  end

  def self.down
    drop_table :load_pattern_per_years
  end
end
