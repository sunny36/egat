class CreateThermoScanFactors < ActiveRecord::Migration
  def self.up
    create_table :thermo_scan_factors do |t|
      t.integer :hi_factor
      t.string :condition
      t.integer :load_start
      t.integer :load_end
      t.integer :delta_start
      t.integer :delta_end
      t.string :color
      t.timestamps
    end

    ThermoScanFactor.create(:hi_factor => 3, :condition => "Good",
                            :delta_start => 0, :delta_end => 9,
                            :load_start => 70, :load_end => 100,
                            :color => "0,255,0")
    ThermoScanFactor.create(:hi_factor => 3, :condition => "Good",
                            :delta_start => 0, :delta_end => 5,
                            :load_start => 40, :load_end => 69,
                            :color => "0,255,0")
    ThermoScanFactor.create(:hi_factor => 3, :condition => "Good",
                            :delta_start => 0, :delta_end => 3,
                            :load_start => 0, :load_end => 39,
                            :color => "0,255,0")

    ThermoScanFactor.create(:hi_factor => 2, :condition => "Acceptable",
                            :delta_start => 10, :delta_end => 35,
                            :load_start => 70, :load_end => 100,
                            :color => "0,0,255")
    ThermoScanFactor.create(:hi_factor => 2, :condition => "Acceptable",
                            :delta_start => 6, :delta_end => 20,
                            :load_start => 40, :load_end => 69,
                            :color => "0,0,255")
    ThermoScanFactor.create(:hi_factor => 2, :condition => "Acceptable",
                            :delta_start => 4, :delta_end => 15,
                            :load_start => 0, :load_end => 69,
                            :color => "0,0,255")

    ThermoScanFactor.create(:hi_factor => 2, :condition => "Need Caution",
                            :delta_start => 36, :delta_end => 75,
                            :load_start => 70, :load_end => 100,
                            :color => "0,255,255")
    ThermoScanFactor.create(:hi_factor => 2, :condition => "Need Caution",
                            :delta_start => 21, :delta_end => 45,
                            :load_start => 40, :load_end => 69,
                            :color => "0,255,255")
    ThermoScanFactor.create(:hi_factor => 2, :condition => "Need Caution",
                            :delta_start => 16, :delta_end => 30,
                            :load_start => 0, :load_end => 39,
                            :color => "0,255,255")

    ThermoScanFactor.create(:hi_factor => 0, :condition => "Very Poor",
                            :delta_start => 75, :delta_end => nil,
                            :load_start => 70, :load_end => 100,
                            :color => "255,0,0")
    ThermoScanFactor.create(:hi_factor => 0, :condition => "Very Poor",
                            :delta_start => 45, :delta_end => nil,
                            :load_start => 40, :load_end => 69,
                            :color => "255,0,0")
    ThermoScanFactor.create(:hi_factor => 0, :condition => "Very Poor",
                            :delta_start => 30, :delta_end => nil,
                            :load_start => 0, :load_end => 39,
                            :color => "255,0,0")




  end

  def self.down
    drop_table :thermo_scan_factors
  end
end
