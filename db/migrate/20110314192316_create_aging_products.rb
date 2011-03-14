class CreateAgingProducts < ActiveRecord::Migration
  def self.up
    create_table :aging_products do |t|
      t.integer :u_start
      t.integer :u_end
      t.integer :start
      t.integer :end
      t.integer :score
      t.integer :score_message
      t.integer :weight
      t.string :name      
      t.timestamps
    end
  end

  def self.down
    drop_table :aging_products
  end
end
