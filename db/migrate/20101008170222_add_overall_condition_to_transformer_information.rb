class AddOverallConditionToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :overall_condition, :integer
  end

  def self.down
    remove_column :transformer_informations, :overall_condition
  end
end