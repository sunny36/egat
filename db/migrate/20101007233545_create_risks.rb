class CreateRisks < ActiveRecord::Migration
  def self.up
    create_table :risks do |t|
      t.integer :start
      t.integer :end
      t.string :risk
      t.string :action      
      t.timestamps
    end
  end

  def self.down
    drop_table :risks
  end
end
