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
  
end