class AddColorValueToOltcOilQuality < ActiveRecord::Migration
  def self.up
    OltcOilQuality.where(:name => 'xbar').where(:score => 4).update_all("color_id = #{Color.find_by_name('orange').id}")
    OltcOilQuality.where(:name => 'xbar').where(:score => 3).update_all("color_id = #{Color.find_by_name('yellow').id}")
    OltcOilQuality.where(:name => 'xbar').where(:score => 2).update_all("color_id = #{Color.find_by_name('blue').id}")
    OltcOilQuality.where(:name => 'xbar').where(:score => 1).update_all("color_id = #{Color.find_by_name('green').id}")
    
    OltcOilQuality.where(:name => 'water_content').where(:score => 5).update_all("color_id = #{Color.find_by_name('red').id}")
    OltcOilQuality.where(:name => 'water_content').where(:score => 4).update_all("color_id = #{Color.find_by_name('orange').id}")
    OltcOilQuality.where(:name => 'water_content').where(:score => 3).update_all("color_id = #{Color.find_by_name('yellow').id}")
    OltcOilQuality.where(:name => 'water_content').where(:score => 2).update_all("color_id = #{Color.find_by_name('blue').id}")
    OltcOilQuality.where(:name => 'water_content').where(:score => 1).update_all("color_id = #{Color.find_by_name('green').id}")

    OltcOilQuality.where(:name => 'color').where(:score => 5).update_all("color_id = #{Color.find_by_name('red').id}")
    OltcOilQuality.where(:name => 'color').where(:score => 4).update_all("color_id = #{Color.find_by_name('orange').id}")
    OltcOilQuality.where(:name => 'color').where(:score => 3).update_all("color_id = #{Color.find_by_name('yellow').id}")
    OltcOilQuality.where(:name => 'color').where(:score => 2).update_all("color_id = #{Color.find_by_name('blue').id}")
    OltcOilQuality.where(:name => 'color').where(:score => 1).update_all("color_id = #{Color.find_by_name('green').id}")    
  end

  def self.down
  end
end
