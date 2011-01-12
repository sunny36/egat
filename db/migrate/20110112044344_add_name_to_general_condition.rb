class AddNameToGeneralCondition < ActiveRecord::Migration
  def self.up
    add_column :visual_inspection_conditions, :name, :string
  end

  def self.down
    remove_column :visual_inspection_conditions, :name
  end
end