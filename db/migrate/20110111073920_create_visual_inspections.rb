class CreateVisualInspections < ActiveRecord::Migration
  def self.up
    create_table :visual_inspections do |t|
      t.string :name      
      t.timestamps
    end
  end

  def self.down
    drop_table :visual_inspections
  end
end
