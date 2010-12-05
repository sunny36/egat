class CreateHifOfOilDgas < ActiveRecord::Migration
  def self.up
    create_table :hif_of_oil_dgas do |t|
      t.integer :hi_factor
      t.string :condition
      t.integer :percent_dgaf_start
      t.integer :percent_dgaf_end

      t.timestamps
    end
  end

  def self.down
    drop_table :hif_of_oil_dgas
  end
end
