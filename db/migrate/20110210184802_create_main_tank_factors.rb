class CreateMainTankFactors < ActiveRecord::Migration
  def self.up
    create_table :main_tank_factors do |t|
      t.integer :hi_factor
      t.string :condition
      t.integer :start
      t.integer :end
      t.string :color

      t.timestamps
    end
  end

  def self.down
    drop_table :main_tank_factors
  end
end
