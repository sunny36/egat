class AddPublicImageToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :public_image, :enum
  end

  def self.down
    remove_column :transformer_informations, :public_image
  end
end