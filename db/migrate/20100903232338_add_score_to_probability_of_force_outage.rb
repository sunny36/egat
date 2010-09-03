class AddScoreToProbabilityOfForceOutage < ActiveRecord::Migration
  def self.up
    add_column :probability_of_force_outages, :score, :integer
    add_column :probability_of_force_outages, :score_message, :string
  end

  def self.down
    remove_column :probability_of_force_outages, :score_message
    remove_column :probability_of_force_outages, :score
  end
end