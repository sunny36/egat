class CreateGeneralConditionFactors < ActiveRecord::Migration
  def self.up
    create_table :general_condition_factors do |t|
      t.integer :hi_factor
      t.string :condition
      t.integer :start
      t.integer :end
      t.string :color

      t.timestamps
    end
  end

  def self.down
    drop_table :general_condition_factors
  end
end
