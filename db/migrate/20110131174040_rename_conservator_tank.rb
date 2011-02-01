class RenameConservatorTank < ActiveRecord::Migration
  def self.up
    rename_table :conservator_tank, :conservator_tanks
  end

  def self.down
    rename_table :conservator_tanks, :conservator_tank
  end
end