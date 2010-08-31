class CreateSystemLocations < ActiveRecord::Migration
  def self.up
    create_table :system_locations do |t|
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :system_locations
  end
end
