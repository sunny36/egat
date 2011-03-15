class AddColorIdToAgingProduct < ActiveRecord::Migration
  def self.up
    add_column :aging_products, :color_id, :integer
    add_index :aging_products, :color_id
  end

  def self.down
    remove_index :aging_products, :color_id
    remove_column :aging_products, :color_id
  end
end