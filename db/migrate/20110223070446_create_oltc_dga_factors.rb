class CreateOltcDgaFactors < ActiveRecord::Migration
  def self.up
    create_table :oltc_dga_factors do |t|
      t.integer :hi_factor
      t.string :condition
      t.string :status
      t.string :color
      t.timestamps
    end
    
    OltcDgaFactor.create(:hi_factor => 4, :condition => "Good",
                         :status => "normal", :color => "0,255,0")


    OltcDgaFactor.create(:hi_factor => 0, :condition => "Very Poor",
                         :status => "not_normal", :color => "255,0,0")

  end

  def self.down
    drop_table :oltc_dga_factors
  end
end
