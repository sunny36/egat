class ModifyOltcQualityData < ActiveRecord::Migration
  def self.up
    OltcOilQuality.where(:name => 'color').update_all('weight = 2')
  end

  def self.down
  end
end
