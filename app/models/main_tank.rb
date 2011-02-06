# == Schema Information
# Schema version: 20110206151332
#
# Table name: main_tanks
#
#  id                   :integer(4)      not null, primary key
#  corrosion            :integer(10)
#  oil_fail             :integer(10)
#  visual_inspection_id :integer(4)
#

class MainTank < ActiveRecord::Base
  belongs_to :visual_inspection
  
  def percent_main_tank_factor
    (numerator/denominator).to_f * 100.0
  end
  
  private
  
    def numerator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.find(self.send(f)).score.to_i *
                VisualInspectionCondition.weight(f, :main_tanks)).to_f
      end
      return sum
    end
    
    def denominator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.max_score(f, :main_tanks) *
                VisualInspectionCondition.weight(f, :main_tanks)).to_f
      end
      return sum
    end

    def fields
      ['corrosion', 'oil_fail']
    end
end
