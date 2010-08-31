class CreatePollutions < ActiveRecord::Migration
  def self.up
    create_table :pollutions do |t|
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :pollutions
  end
end
