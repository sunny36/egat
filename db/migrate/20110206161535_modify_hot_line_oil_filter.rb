class ModifyHotLineOilFilter < ActiveRecord::Migration
  def self.up
    remove_column :hot_line_oil_filters, :version
    remove_column :hot_line_oil_filters, :test_by
    remove_column :hot_line_oil_filters, :test_date
    remove_column :hot_line_oil_filters, :work_order
    remove_column :hot_line_oil_filters, :perform_type
    remove_column :hot_line_oil_filters, :transformer
    add_column :hot_line_oil_filters, :visual_inspection_id, :integer
  end

  def self.down
    remove_column :hot_line_oil_filters, :visual_inspection_id
  end
end