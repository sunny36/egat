class RenameSurgeArresterConditionFactorsToSurgeArresterFactors < ActiveRecord::Migration
  def self.up
    rename_table :surge_arrester_condition_factors, :surge_arrester_factors
  end

  def self.down
    rename_table :surge_arrester_factors, :surge_arrester_condition_factors
  end
end
