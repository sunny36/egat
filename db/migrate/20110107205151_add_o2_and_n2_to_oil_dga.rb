class AddO2AndN2ToOilDga < ActiveRecord::Migration
  def self.up
    add_column :oil_dgas, :o2, :integer
    add_column :oil_dgas, :n2, :integer
  end

  def self.down
    remove_column :oil_dgas, :n2
    remove_column :oil_dgas, :o2
  end
end