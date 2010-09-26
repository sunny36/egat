xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.rows do
  xml.page 1
  xml.total 1
  xml.records @application_uses.size
  @application_uses.each do |u|
    xml.row :id => u.id do
      xml.cell u.value
      xml.cell u.score
      xml.cell u.score_message
    end
  end
end
