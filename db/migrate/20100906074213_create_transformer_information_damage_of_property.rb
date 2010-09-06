class CreateTransformerInformationDamageOfProperty < ActiveRecord::Migration
  def self.up
    create_table :damage_of_properties_transformer_informations, :id => false do |t|
      t.integer :damage_of_property_id      
      t.integer :transformer_information_id      
      t.timestamps
    end
  end

  def self.down
    drop_table :damage_of_properties_transformer_informations
  end
end