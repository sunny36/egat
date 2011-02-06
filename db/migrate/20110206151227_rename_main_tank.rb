class RenameMainTank < ActiveRecord::Migration
  def self.up
    rename_table :maintank, :main_tanks
  end

  def self.down
    rename_table :main_tanks, :maintank
  end
end