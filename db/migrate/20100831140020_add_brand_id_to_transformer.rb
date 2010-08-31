class AddBrandIdToTransformer < ActiveRecord::Migration
  def self.up
    add_column :transformer, :brand_id, :integer
  end

  def self.down
    remove_column :transformer, :brand_id
  end
end
