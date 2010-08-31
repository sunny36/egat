class CreateProbabilityOfForceOutages < ActiveRecord::Migration
  def self.up
    create_table :probability_of_force_outages do |t|
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :probability_of_force_outages
  end
end
