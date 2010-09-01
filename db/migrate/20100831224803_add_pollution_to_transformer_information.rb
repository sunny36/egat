class AddPollutionToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :pollution_id, :integer
  end

  def self.down
    remove_column :transformer_informations, :pollution_id
  end
end