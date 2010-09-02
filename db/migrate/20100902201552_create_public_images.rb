class CreatePublicImages < ActiveRecord::Migration
  def self.up
    create_table :public_images do |t|
      t.string :value
      t.integer :score
      t.string :score_message      
      t.timestamps
    end
  end

  def self.down
    drop_table :public_images
  end
end
