# == Schema Information
# Schema version: 20110208042941
#
# Table name: oltc_control_cabinets
#
#  id                   :integer(4)      not null, primary key
#  animal               :integer(10)
#  control_humidity     :integer(10)
#  corrosion            :integer(10)
#  pragen               :integer(10)
#  wiring_control       :integer(10)
#  visual_inspection_id :integer(4)
#

class OltcControlCabinet < ActiveRecord::Base
  belongs_to :visual_inspection
  
  def percent_oltc_control_cabinet_factor
    (numerator/denominator).to_f * 100.0
  end
  
  private
    def numerator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.find(self.send(f)).score.to_i *
                VisualInspectionCondition.weight(f, :oltc_control_cabinets)).to_f
      end
      return sum      
    end
    
    def denominator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.max_score(f, :oltc_control_cabinets) *
                VisualInspectionCondition.weight(f, :oltc_control_cabinets)).to_f
      end
      return sum
    end
    
    def fields
      ['corrosion', 'animal', 'control_humidity', 'pragen', 'wiring_control']
    end
end
