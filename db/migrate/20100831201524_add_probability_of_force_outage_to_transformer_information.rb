class AddProbabilityOfForceOutageToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :probability_of_force_outage_id, :integer
  end

  def self.down
    remove_column :transformer_informations, :probability_of_force_outage_id
  end
end