class CreateApplicationUses < ActiveRecord::Migration
  def self.up
    create_table :application_uses do |t|
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :application_uses
  end
end
