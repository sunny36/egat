class RenameGeneralConditionTableToGeneralConditions < ActiveRecord::Migration
  def self.up
    rename_table :general_condition, :general_conditions
  end

  def self.down
    rename_table :general_conditions, :general_condition
  end
end