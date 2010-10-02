class RemoveValueAndAddStartAndEndToPorbabilityOfForceOutage < ActiveRecord::Migration
  def self.up
    remove_column :probability_of_force_outages, :value
    add_column :probability_of_force_outages, :start, :integer
    add_column :probability_of_force_outages, :end, :integer
  end

  def self.down
    add_column :probability_of_force_outages, :value, :string
    remove_column :probability_of_force_outages, :start
    remove_column :probability_of_force_outages, :end
  end
end