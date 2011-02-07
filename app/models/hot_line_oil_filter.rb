# == Schema Information
# Schema version: 20110206175519
#
# Table name: hot_line_oil_filters
#
#  id                   :integer(4)      not null, primary key
#  corrosion            :integer(10)
#  pressure             :integer(10)
#  visual_inspection_id :integer(4)
#

class HotLineOilFilter < ActiveRecord::Base
  belongs_to :visual_inspection
  
  def percent_hot_line_oil_filter_factor
    (numerator/denominator).to_f * 100.0
  end
  
  private
    def numerator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.find(self.send(f)).score.to_i *
                VisualInspectionCondition.weight(f, :hot_line_oil_filters)).to_f
      end
      return sum      
    end
    
    def denominator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.max_score(f, :hot_line_oil_filters) *
                VisualInspectionCondition.weight(f, :hot_line_oil_filters)).to_f
      end
      return sum
    end
    
    def fields
      ['corrosion', 'pressure']
    end
end
