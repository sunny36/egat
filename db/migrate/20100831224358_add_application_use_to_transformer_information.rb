class AddApplicationUseToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :application_use_id, :integer
  end

  def self.down
    remove_column :transformer_informations, :application_use_id
  end
end