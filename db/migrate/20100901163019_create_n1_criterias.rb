class CreateN1Criterias < ActiveRecord::Migration
  def self.up
    create_table :n1_criterias do |t|
      t.string :value
      t.integer :score
      t.string :score_message      
      t.timestamps
    end
  end

  def self.down
    drop_table :n1_criterias
  end
end