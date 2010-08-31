class CreateSystemStabilities < ActiveRecord::Migration
  def self.up
    create_table :system_stabilities do |t|
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :system_stabilities
  end
end
