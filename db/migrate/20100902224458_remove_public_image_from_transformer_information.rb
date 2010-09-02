class RemovePublicImageFromTransformerInformation < ActiveRecord::Migration
  def self.up
    remove_column :transformer_informations, :public_image
  end

  def self.down
    add_column :transformer_informations, :public_image, :string
  end
end
