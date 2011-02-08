class RenameOltcControlCabinet < ActiveRecord::Migration
  def self.up
    rename_table :oltc_control_cab, :oltc_control_cabinets
  end

  def self.down
    rename_table :oltc_control_cabinets, :oltc_control_cab
  end
end