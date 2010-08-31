class AddColumnsToBrand < ActiveRecord::Migration
  def self.up
    add_column :brands, :name, :string
  end

  def self.down
    remove_column :brands, :name
  end
end
