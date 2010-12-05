class RemoveC4H6AndAddC2H6FromOilDga < ActiveRecord::Migration
  def self.up
    remove_column :oil_dgas, :c4h6
    remove_column :oil_dgas, :c4h6_score
    add_column :oil_dgas, :c2h6, :integer
    add_column :oil_dgas, :c2h6_score, :integer
  end

  def self.down
    remove_column :oil_dgas, :c2h6_score
    remove_column :oil_dgas, :c2h6
    add_column :oil_dgas, :c4h6_score, :integer
    add_column :oil_dgas, :c4h6, :integer
  end
end