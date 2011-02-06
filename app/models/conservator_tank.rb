# == Schema Information
# Schema version: 20110203165120
#
# Table name: conservator_tanks
#
#  id                   :integer(4)      not null, primary key
#  breather_maintank    :integer(10)
#  breather_oltc        :integer(10)
#  corrosion_maintank   :integer(10)
#  corrosion_oltc       :integer(10)
#  jel_color_maintank   :integer(10)
#  jel_color_oltc       :integer(10)
#  oil_level_maintank   :integer(10)
#  oil_level_oltc       :integer(10)
#  oilfail_maintank     :integer(10)
#  oilfail_oltc         :integer(10)
#  visual_inspection_id :integer(4)
#

class ConservatorTank < ActiveRecord::Base
  belongs_to :visual_inspection


  def percent_conservator_tank_factor
    (numerator/denominator).to_f * 100.0
  end
  
  def numerator
   sum = 0
   fields.each do |f|
     sum += (VisualInspectionCondition.find(self.send(f)).score.to_i * 
             VisualInspectionCondition.weight(f, :conservator_tanks)).to_f
   end 
   return sum
  end
  
  def denominator
    sum = 0
    fields.each do |f|
      sum += (VisualInspectionCondition.max_score(f, :conservator_tanks) *
              VisualInspectionCondition.weight(f, :conservator_tanks)).to_f
    end
    return sum
  end
  
  def fields
    oltc_fields = ['corrosion_oltc', 'oilfail_oltc', 'oil_level_oltc',
                   'jel_color_oltc', 'breather_oltc']
    maintank_fields = ['corrosion_maintank', 'oilfail_maintank', 
                       'oil_level_maintank', 'jel_color_maintank', 
                       'breather_maintank']    
    return oltc_fields + maintank_fields
  end

end
