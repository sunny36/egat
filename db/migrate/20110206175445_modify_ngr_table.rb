class ModifyNgrTable < ActiveRecord::Migration
  def self.up
    rename_table :ngr, :ngrs
  end

  def self.down
    rename_table :ngrs, :ngr
  end
end