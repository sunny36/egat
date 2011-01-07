class AddColorToHifOfOilDga < ActiveRecord::Migration
  def self.up
    add_column :hif_of_oil_dgas, :color, :string
  end

  def self.down
    remove_column :hif_of_oil_dgas, :color
  end
end