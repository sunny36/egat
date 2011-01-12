class RenamePercentLoadToMaxLoadInGeneralCondition < ActiveRecord::Migration
  def self.up
    rename_column :general_conditions, :percentload, :maxload
  end

  def self.down
    rename_column :general_conditions, :maxload, :percentload
  end
end