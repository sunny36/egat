class AddVisualInspectionIdToGeneralCondition < ActiveRecord::Migration
  def self.up
    add_column :general_conditions, :visual_inspection_id, :integer
  end

  def self.down
    remove_column :general_conditions, :visual_inspection_id
  end
end