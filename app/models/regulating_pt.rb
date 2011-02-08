# == Schema Information
# Schema version: 20110207140628
#
# Table name: regulating_pts
#
#  id                   :integer(4)      not null, primary key
#  oil_color            :integer(10)
#  oil_fail             :integer(10)
#  oil_level            :integer(10)
#  pocelain_clean       :integer(10)
#  pocelain_status      :integer(10)
#  visual_inspection_id :integer(4)
#

class RegulatingPt < ActiveRecord::Base
  belongs_to :visual_inspection
  
  def percent_regulating_pt_factor
    (numerator/denominator).to_f * 100.0
  end
  
  private
    def numerator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.find(self.send(f)).score.to_i *
                VisualInspectionCondition.weight(f, :regulating_pts)).to_f
      end
      return sum      
    end
    
    def denominator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.max_score(f, :regulating_pts) *
                VisualInspectionCondition.weight(f, :regulating_pts)).to_f
      end
      return sum
    end
    
    def fields
      ['pocelain_status', 'pocelain_clean', 'oil_fail', 'oil_level', 
        'oil_color']
    end
  
end
