class CreateArresterFactors < ActiveRecord::Migration
  def self.up
    create_table :arrester_factors do |t|
      t.integer :hi_factor
      t.string :condition
      t.integer :start
      t.integer :end
      t.string :color_id
      t.timestamps
    end
  end

  def self.down
    drop_table :arrester_factors
  end
end
