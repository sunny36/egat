class CreateColors < ActiveRecord::Migration
  def self.up
    create_table :colors do |t|
      t.string :name
      t.string :value      
      t.timestamps
    end
    
    Color.create(:name => 'green', :value => "0,255,0")
    Color.create(:name => 'blue', :value => "0,0,255")
    Color.create(:name => 'yellow', :value => "255,255,0")
    Color.create(:name => 'orange', :value => "255,146,0")
    Color.create(:name => 'red', :value => "255,0,0")
  end

  def self.down
    drop_table :colors
  end
end
