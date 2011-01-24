class AddSurgeCounterToSurgeArrester < ActiveRecord::Migration
  def self.up
    add_column :surge_arresters, :surge_counter, :integer
  end

  def self.down
    remove_column :surge_arresters, :surge_counter
  end
end