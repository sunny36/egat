class AddTestTypeToInsulatingOil < ActiveRecord::Migration
  def self.up
    add_column :insulating_oils, :test_type, :string
  end

  def self.down
    remove_column :insulating_oils, :test_type
  end
end