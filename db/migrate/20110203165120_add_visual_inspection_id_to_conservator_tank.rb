class AddVisualInspectionIdToConservatorTank < ActiveRecord::Migration
  def self.up
    add_column :conservator_tanks, :visual_inspection_id, :integer
  end

  def self.down
    remove_column :conservator_tanks, :visual_inspection_id
  end
end