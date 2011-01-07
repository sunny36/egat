class Temp < Thor
  
  desc "add_position_transformer_name", "add position to transformer name"
  def add_position_transformer_name
    require 'spreadsheet'
    require File.expand_path('config/environment.rb')
    book = Spreadsheet.open  '/Users/somchok/code/egat/doc/Tx_Positon1.xls'
    sheet1 = book.worksheet 0
    sheet1.each do |row|      
      transformer = Transformer.find_by_egatsn(row[0].to_i.to_s)
      transformer.position = row[1].to_s
      transformer.transformer_name = transformer.transformer_name + row[1].to_s
      transformer.save!
    end
  end
  
  desc "modify OilPitch to OilPit", "modify OilPitch to OilPit"
  def modify_oil_pitch_to_oil_pit
    require File.expand_path('config/environment.rb')
    damage_of_property = DamageOfProperty.find_by_value(2)
    damage_of_property.message = "มี Oil Pit"
    damage_of_property.save!
  end

  desc "modify damage of property score 5", "modify damage of property score 5"
  def modify_damage_of_property_score_5
    require File.expand_path('config/environment.rb')
    damage_of_property = DamageOfProperty.find_by_value(5)
    damage_of_property.message = "ไม่มีทั้ง 4 ข้อข้างต้น"
    damage_of_property.save!
  end
  
end