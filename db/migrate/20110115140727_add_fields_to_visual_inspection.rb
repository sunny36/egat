class AddFieldsToVisualInspection < ActiveRecord::Migration
  def self.up
    remove_column :visual_inspections, :name
    add_column :visual_inspections, :test_type, :string
    add_column :visual_inspections, :test_by, :string
    add_column :visual_inspections, :test_date, :date
    add_column :visual_inspections, :oltc_counter, :string
    add_column :visual_inspections, :work_order, :string
  end

  def self.down
    remove_column :visual_inspections, :work_order
    remove_column :visual_inspections, :oltc_counter
    remove_column :visual_inspections, :test_date
    remove_column :visual_inspections, :test_by
    remove_column :visual_inspections, :test_type
    add_column :visual_inspections, :name, :string
  end
end