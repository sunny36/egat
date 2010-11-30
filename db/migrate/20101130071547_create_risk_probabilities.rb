class CreateRiskProbabilities < ActiveRecord::Migration
  def self.up
    create_table :risk_probabilities do |t|
      t.integer :start
      t.integer :end
      t.string :probability_of_failure
      t.string :action

      t.timestamps
    end
  end

  def self.down
    drop_table :risk_probabilities
  end
end
