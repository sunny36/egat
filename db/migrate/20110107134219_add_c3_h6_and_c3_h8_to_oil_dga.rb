class AddC3H6AndC3H8ToOilDga < ActiveRecord::Migration
  def self.up
    add_column :oil_dgas, :c3h6, :integer
    add_column :oil_dgas, :c3h8, :integer
  end

  def self.down
    remove_column :oil_dgas, :c3h6
    remove_column :oil_dgas, :c3h8
  end
end