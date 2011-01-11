class RenameVisualInspectionCondtionToVisualInspectionConditions < ActiveRecord::Migration
  def self.up
    rename_table :visual_inspection_condtions, :visual_inspection_conditions
  end

  def self.down
    rename_table :visual_inspection_conditions, :visual_inspection_condtions
  end
end