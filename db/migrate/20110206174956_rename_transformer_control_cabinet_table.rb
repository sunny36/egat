class RenameTransformerControlCabinetTable < ActiveRecord::Migration
  def self.up
    rename_table :trans_control_cab, :transformer_control_cabinets
  end

  def self.down
    rename_table :transformer_control_cabinets, :trans_control_cab
  end
end