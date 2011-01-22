class CreateLoadHistoryFactors < ActiveRecord::Migration
  def self.up
    create_table :load_history_factors do |t|
      t.column :hi_factor, :integer
      t.column :condition, :string
      t.column :start, :integer
      t.column :end, :integer
      t.column :color, :string
      
      t.timestamps
    end
  end

  def self.down
    drop_table :load_history_factors
  end
end
