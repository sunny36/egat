class AddCategoryToVisualInspectionCondition < ActiveRecord::Migration
  def self.up
    add_column :visual_inspection_conditions, :table_name, :string
  end

  def self.down
    remove_column :visual_inspection_conditions, :table_name
  end
end
