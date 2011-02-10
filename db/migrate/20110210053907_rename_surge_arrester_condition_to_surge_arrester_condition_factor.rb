class RenameSurgeArresterConditionToSurgeArresterConditionFactor < ActiveRecord::Migration
  def self.up
    rename_table "surge_arrester_conditions", "surge_arrester_condition_factors"
  end

  def self.down
    rename_table "surge_arrester_condition_factors", "surge_arrester_conditions"
  end
end
