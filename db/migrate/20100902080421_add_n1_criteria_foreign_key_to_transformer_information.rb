class AddN1CriteriaForeignKeyToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :n1_criteria_id, :integer
  end

  def self.down
    remove_column :transformer_informations, :n1_criteria_id
  end
end