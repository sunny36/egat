class RenameOltcCompartment < ActiveRecord::Migration
  def self.up
    rename_table :oltc_compartment, :oltc_compartments
  end

  def self.down
    rename_table :oltc_compartments, :oltc_compartment
  end
end