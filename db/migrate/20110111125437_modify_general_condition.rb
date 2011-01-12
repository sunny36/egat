class ModifyGeneralCondition < ActiveRecord::Migration
  def self.up
    remove_column :general_conditions, :version
    rename_column :general_conditions, :transformer, :transformer_id
  end

  def self.down
    rename_column :general_conditions, :transformer_id, :transformer
    add_column :general_conditions, :version, :integer
  end
end