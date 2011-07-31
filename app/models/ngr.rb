# == Schema Information
# Schema version: 20110206175519
#
# Table name: ngrs
#
#  id                   :integer(4)      not null, primary key
#  base_status          :integer(10)
#  ground_connector     :integer(10)
#  ngr_status           :integer(10)
#  pocelain_clean       :integer(10)
#  visual_inspection_id :integer(4)
#

class Ngr < ActiveRecord::Base
  belongs_to :visual_inspection

  def self.most_recent(transformer)
    visual_inspections = VisualInspection.where("transformer_id = ?", transformer.id).order("test_date DESC")
    visual_inspections.each do |visual_inspection|
      ngr = visual_inspection.ngr
      unless(ngr.base_status.nil? || ngr.ground_connector.nil? || ngr.ngr_status.nil? || ngr.pocelain_clean.nil?)
        return ngr
      else
        return nil
      end
    end
  end

  def hi_factor
    return nil if all_attributes_are_nil?
    NgrFactor.all.each do |i|
      i.end = 100 if i.end.nil?
      if percent_ngr_factor.round.between?(i.start, i.end)
        return i.hi_factor
      end
    end
  end

  def percent_ngr_factor
    return nil if all_attributes_are_nil?
    (numerator/denominator).to_f * 100.0
  end

  private
    def numerator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.find(self.send(f)).score.to_i *
                VisualInspectionCondition.weight(f, :ngrs)).to_f
      end
      return sum
    end

    def denominator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.max_score(f, :ngrs) *
                VisualInspectionCondition.weight(f, :ngrs)).to_f
      end
      return sum
    end

    def all_attributes_are_nil?
      if self.base_status.nil? || self.ground_connector.nil? || self.ngr_status.nil? || self.pocelain_clean.nil?
        return true
      else
        return false
      end
    end

    def fields
      ['base_status', 'ground_connector', 'ngr_status', 'pocelain_clean']
    end
end
