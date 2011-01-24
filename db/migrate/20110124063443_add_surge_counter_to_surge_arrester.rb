class AddSurgeCounterToSurgeArrester < ActiveRecord::Migration
  def self.up
    add_column :surge_arresters, :surge_counter_hv, :integer
    add_column :surge_arresters, :surge_counter_lv, :integer
    add_column :surge_arresters, :surge_counter_tv, :integer
  end

  def self.down
    remove_column :surge_arresters, :surge_counter_tv
    remove_column :surge_arresters, :surge_counter_lv
    remove_column :surge_arresters, :surge_counter
  end
end