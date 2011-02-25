class CreateOltcOilQualityFactors < ActiveRecord::Migration
  def self.up
    create_table :oltc_oil_quality_factors do |t|
      t.integer :hi_factor
      t.string :condition
      t.integer :start
      t.integer :end
      t.string :color
      t.timestamps
    end
    OltcOilQualityFactor.create(:hi_factor => 4, :condition => "Good",
                                :start => nil, :end => 20, :color => "0,255,0")

    OltcOilQualityFactor.create(:hi_factor => 3, :condition => "Acceptable",
                                :start => 21, :end => 30, :color => "0,0,255")

    OltcOilQualityFactor.create(:hi_factor => 2, :condition => "Need Caution",
                                :start => 31, :end => 40, :color => "0,255,255")

    OltcOilQualityFactor.create(:hi_factor => 1, :condition => "Poor",
                                :start => 41, :end => 50,
                                :color => "255,146,0")

    OltcOilQualityFactor.create(:hi_factor => 0, :condition => "Very Poor",
                                :start => 51, :end => nil, :color => "255,0,0")

  end

  def self.down
    drop_table :oltc_oil_quality_factors
  end
end
