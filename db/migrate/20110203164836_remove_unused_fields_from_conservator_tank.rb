class RemoveUnusedFieldsFromConservatorTank < ActiveRecord::Migration
  def self.up
    remove_column :conservator_tanks, :version
    remove_column :conservator_tanks, :test_by
    remove_column :conservator_tanks, :test_date
    remove_column :conservator_tanks, :work_order
    remove_column :conservator_tanks, :perform_type
    remove_column :conservator_tanks, :transformer
  end

  def self.down
  end
end
