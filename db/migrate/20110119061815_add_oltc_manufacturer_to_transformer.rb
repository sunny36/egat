class AddOltcManufacturerToTransformer < ActiveRecord::Migration
  def self.up
    add_column :transformer, :oltc_manufacturer, :string 
    add_column :transformer, :oltc_type, :string
    remove_column :transformer, :oltc_manufacturing
    remove_column :transformer, :oltc_model
  end

  def self.down
    remove_column :transformer, :oltc_manufacturer 
    remove_column :transformer, :oltc_type 
  end
end
