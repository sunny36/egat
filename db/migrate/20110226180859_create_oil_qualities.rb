class CreateOilQualities < ActiveRecord::Migration
  def self.up
    create_table :oil_qualities do |t|
      t.string :name
      t.integer :u_start
      t.integer :u_end
      t.float :start
      t.float :end
      t.integer :score
      t.integer :weight
      t.integer :color_id      
      t.timestamps
    end
  end

  def self.down
    drop_table :oil_qualities
  end
end
