class RenameHotLineOilFilter < ActiveRecord::Migration
  def self.up
    rename_table :hot_line_oil_filter, :hot_line_oil_filters
  end

  def self.down
    rename_table :hot_line_oil_filters, :hot_line_oil_filter
  end
end