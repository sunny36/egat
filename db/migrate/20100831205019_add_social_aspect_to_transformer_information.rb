class AddSocialAspectToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :social_aspect_id, :integer
  end

  def self.down
    remove_column :transformer_informations, :social_aspect_id
  end
end