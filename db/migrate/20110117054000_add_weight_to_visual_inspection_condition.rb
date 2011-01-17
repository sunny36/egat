class AddWeightToVisualInspectionCondition < ActiveRecord::Migration
  def self.up
    add_column :visual_inspection_conditions, :weight, :integer
  end

  def self.down
    remove_column :visual_inspection_conditions, :weight
  end
end