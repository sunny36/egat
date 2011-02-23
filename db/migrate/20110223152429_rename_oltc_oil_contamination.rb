class RenameOltcOilContamination < ActiveRecord::Migration
  def self.up
    rename_table :oltc_oil_contamination, :oltc_oil_contaminations
  end

  def self.down
    rename_table :oltc_oil_contaminations, :oltc_oil_contamination
  end
end
