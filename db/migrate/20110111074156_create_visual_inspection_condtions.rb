class CreateVisualInspectionCondtions < ActiveRecord::Migration
  def self.up
    create_table :visual_inspection_condtions do |t|
      t.string :name
      t.integer :start
      t.integer :end
      t.integer :score
      t.string :score_message
      t.integer :visual_inspection_id      
      t.timestamps
    end
  end

  def self.down
    drop_table :visual_inspection_condtions
  end
end
