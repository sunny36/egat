class AddN1CriteriaToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :n1_criteria, :enum
  end

  def self.down
    remove_column :transformer_informations, :n1_criteria
  end
end
