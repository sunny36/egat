class RenameRegulatingpt < ActiveRecord::Migration
  def self.up
    rename_table :regulatingpt, :regulating_pts
  end

  def self.down
    rename_table :regulating_pts, :regulatingpt
  end
end