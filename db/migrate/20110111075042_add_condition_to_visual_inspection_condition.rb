class AddConditionToVisualInspectionCondition < ActiveRecord::Migration
  def self.up
    add_column :visual_inspection_condtions, :condition, :string
  end

  def self.down
    remove_column :visual_inspection_condtions, :condition
  end
end