class RenameNameToDescriptionInGeneralCondition < ActiveRecord::Migration
  def self.up
    rename_column :visual_inspection_conditions, :name, :description
  end

  def self.down
    rename_column :visual_inspection_conditions, :description, :name
  end
end