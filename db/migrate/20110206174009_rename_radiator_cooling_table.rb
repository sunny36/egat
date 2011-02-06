class RenameRadiatorCoolingTable < ActiveRecord::Migration
  def self.up
    rename_table :radiator_cooling, :radiator_cooling_systems
  end

  def self.down
    rename_table :radiator_cooling_systems, :radiator_cooling
  end
end