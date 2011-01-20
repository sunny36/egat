class AddVisualInspectionIdToBushingCondition < ActiveRecord::Migration
  def self.up
    add_column :bushing_conditions, :visual_inspection_id, :integer
  end

  def self.down
    remove_column :bushing_conditions, :visual_inspection_id
  end
end