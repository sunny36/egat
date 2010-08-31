class CreateDamageOfProperties < ActiveRecord::Migration
  def self.up
    create_table :damage_of_properties do |t|
      t.string :value
      t.string :message
      t.timestamps
    end
  end

  def self.down
    drop_table :damage_of_properties
  end
end
