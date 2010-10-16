class CreateImportanceIndices < ActiveRecord::Migration
  def self.up
    create_table :importance_indices do |t|
      t.integer :start
      t.integer :end
      t.string :importance
      t.string :action

      t.timestamps
    end
  end

  def self.down
    drop_table :importance_indices
  end
end
