class AddColumnsToBushingConditionFactor < ActiveRecord::Migration
  def self.up
    add_column :bushing_condition_factors, :hi_factor, :integer
    add_column :bushing_condition_factors, :condition, :string
    add_column :bushing_condition_factors, :start, :integer
    add_column :bushing_condition_factors, :end, :integer
    add_column :bushing_condition_factors, :color, :string
  end

  def self.down
    remove_column :bushing_condition_factors, :color
    remove_column :bushing_condition_factors, :end
    remove_column :bushing_condition_factors, :start
    remove_column :bushing_condition_factors, :condition
    remove_column :bushing_condition_factors, :hi_factor
  end
end