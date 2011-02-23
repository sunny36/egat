class RenameOilContamination < ActiveRecord::Migration
  def self.up
    rename_table :oil_contamination, :oil_contaminations
  end

  def self.down
    rename_table :oil_contaminations, :oil_contamination
  end
end
