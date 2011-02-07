# == Schema Information
# Schema version: 20110206175519
#
# Table name: radiator_cooling_systems
#
#  id                   :integer(4)      not null, primary key
#  animal               :integer(10)
#  corrosion            :integer(10)
#  noise_level          :integer(10)
#  oil_fail             :integer(10)
#  oil_pump             :integer(10)
#  visual_inspection_id :integer(4)
#

class RadiatorCoolingSystem < ActiveRecord::Base
  belongs_to :visual_inspection
  
  def percent_radiator_cooling_system_factor
    (numerator/denominator).to_f * 100.0
  end
  
  private
    def numerator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.find(self.send(f)).score.to_i *
                VisualInspectionCondition.weight(f, :radiator_cooling_systems)).to_f
      end
      return sum      
    end
    
    def denominator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.max_score(f, :radiator_cooling_systems) *
                VisualInspectionCondition.weight(f, :radiator_cooling_systems)).to_f
      end
      return sum
    end
    
    def fields
      ['animal', 'corrosion', 'noise_level', 'oil_fail', 'oil_pump']
    end
end
