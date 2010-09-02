class RemoveN1CriteriaFromTransformerInformation < ActiveRecord::Migration
  def self.up
    remove_column :transformer_informations, :n1_criteria
  end

  def self.down
    add_column :transformer_informations, :n1_criteria, :string
  end
end