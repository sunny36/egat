class CreateBushingConditionFactors < ActiveRecord::Migration
  def self.up
    create_table :bushing_condition_factors do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :bushing_condition_factors
  end
end
