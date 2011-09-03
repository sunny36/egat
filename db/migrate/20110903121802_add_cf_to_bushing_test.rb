class AddCfToBushingTest < ActiveRecord::Migration
  def self.up
    add_column :bushing_tests, :cf, :decimal
  end

  def self.down
    remove_column :bushing_tests, :cf
  end
end