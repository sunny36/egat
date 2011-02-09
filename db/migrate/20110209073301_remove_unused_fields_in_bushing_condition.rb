class RemoveUnusedFieldsInBushingCondition < ActiveRecord::Migration
  def self.up
    remove_column :bushing_conditions, :version
    remove_column :bushing_conditions, :test_by
    remove_column :bushing_conditions, :test_date
    remove_column :bushing_conditions, :work_order
    remove_column :bushing_conditions, :perform_type
    remove_column :bushing_conditions, :transformer_id
  end

  def self.down
  end
end
