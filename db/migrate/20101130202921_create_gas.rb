class CreateGas < ActiveRecord::Migration
  def self.up
    create_table :gas do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :gas
  end
end
