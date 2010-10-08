class ChangeOverConditionToDouble < ActiveRecord::Migration
  def self.up
    change_column :transformer_informations, :overall_condition, :double
  end

  def self.down
    change_column :transformer_informations, :overall_condition, :string
  end
end