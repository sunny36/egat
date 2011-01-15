class AddTransformerIdToVisualInspection < ActiveRecord::Migration
  def self.up
    add_column :visual_inspections, :transformer_id, :integer
  end

  def self.down
    remove_column :visual_inspections, :transformer_id
  end
end