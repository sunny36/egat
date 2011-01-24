class RenameLightningArresterToSurgeArresters < ActiveRecord::Migration
  def self.up
    rename_table :lightning_arrester, :surge_arresters 
  end

  def self.down
    rename_table :surge_arresters, :lightning_arrester
  end
end