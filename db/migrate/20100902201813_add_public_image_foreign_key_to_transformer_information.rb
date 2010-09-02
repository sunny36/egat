class AddPublicImageForeignKeyToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :public_image_id, :integer
  end

  def self.down
    remove_column :transformer_informations, :public_image_id
  end
end