class CreateInsulatingOilWeights < ActiveRecord::Migration
  def self.up
    create_table :insulating_oil_weights do |t|
      t.string :name
      t.string :description
      t.integer :weight
      t.timestamps
    end
  end

  def self.down
    drop_table :insulating_oil_weights
  end
end
