class Import < Thor

  desc "import_oltc_typ_to_transformer", "Import OLTC Type to Transformer table"
  def import_oltc_type_to_transformer
    require File.expand_path('config/environment.rb')
    require 'spreadsheet'
    transformer = Transformer.find(1)
    book = 
      Spreadsheet.open [Rails.root, "/", "doc/Tx_Database_Text_010910.xls"].join
    sheet1 = book.worksheet 0
    sheet1.each do |row|
      puts "#{row[0].to_i.to_s}, #{row[13].to_s}, #{row[14].to_s}" 
      if row[0].to_i > 0
        transformer = Transformer.find(row[0].to_s.to_i)
        transformer.oltc_manufacturer = row[13].to_s
        transformer.oltc_type = row[14].to_s
        transformer.save!
      end
    end
  end

end
