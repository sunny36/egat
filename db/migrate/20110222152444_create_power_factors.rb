class CreatePowerFactors < ActiveRecord::Migration
  def self.up
    create_table :power_factors do |t|
      t.integer :hi_factor
      t.string :condition
      t.float :start
      t.float :end
      t.string :color
      t.timestamps
    end
    PowerFactor.create(:hi_factor => 4, :condition => "Good",
                       :start => 0, :end => 0.5, :color => "0,255,0")

    PowerFactor.create(:hi_factor => 3, :condition => "Acceptable",
                       :start => 0.5, :end => 1.0, :color => "0,0,255")

    PowerFactor.create(:hi_factor => 2, :condition => "Need Caution",
                       :start => 1.1, :end => 1.5,
                       :color => "0,255,255")

    PowerFactor.create(:hi_factor => 1, :condition => "Poor",
                       :start => 1.6, :end => 2.0,
                       :color => "255,146,0")

    PowerFactor.create(:hi_factor => 0, :condition => "Very Poor",
                       :start => 2.0, :end => nil, :color => "255,0,0")

  end

  def self.down
    drop_table :power_factors
  end
end
