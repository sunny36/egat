class RemoveUnusedFieldsInSurgeArrester < ActiveRecord::Migration
  def self.up
    remove_column :surge_arresters, :version
    remove_column :surge_arresters, :test_by
    remove_column :surge_arresters, :test_date
    remove_column :surge_arresters, :work_order
    remove_column :surge_arresters, :perform_type
    remove_column :surge_arresters, :leakage_current_hv
    remove_column :surge_arresters, :leakage_current_lv
    remove_column :surge_arresters, :leakage_current_tv
  end

  def self.down
    add_column :surge_arresters, :leakage_current_tv, :decimal,  :precision => 10, :scale => 0
    add_column :surge_arresters, :leakage_current_lv, :decimal,  :precision => 10, :scale => 0
    add_column :surge_arresters, :leakage_current_hv, :decimal,  :precision => 10, :scale => 0
    add_column :surge_arresters, :perform_type, :decimal,  :precision => 10, :scale => 0
    add_column :surge_arresters, :work_order, :string
    add_column :surge_arresters, :test_date, :datetime
    add_column :surge_arresters, :test_by, :string
    add_column :surge_arresters, :version, :integer
  end
end
