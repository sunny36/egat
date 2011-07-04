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

  def self.most_recent(transformer)
    visual_inspections = VisualInspection.where("transformer_id = ?", transformer.id).order("test_date DESC")
    visual_inspections.each do |visual_inspection|
      unless visual_inspection.hot_line_oil_filter.corrosion.nil? && visual_inspection.hot_line_oil_filter.pressure.nil?
        return visual_inspection.hot_line_oil_filter
      end
    end
  end
  
  def hi_factor
    HotLineOilFilterFactor.all.each do |i|
      i.end = 100 if i.end.nil?
      return i.hi_factor if percent_hot_line_oil_filter_factor.round.between?(i.start, i.end)
    end
  end

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
