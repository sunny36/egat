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

  def self.most_recent(transformer)
    visual_inspections = VisualInspection.where("transformer_id = ?", transformer.id).order("test_date DESC")
    visual_inspections.each do |visual_inspection|
      regulating_pt = visual_inspection.regulating_pt
      unless(regulating_pt.oil_color.nil?      ||
             regulating_pt.oil_fail.nil?       ||
             regulating_pt.oil_level.nil?      ||
             regulating_pt.pocelain_clean.nil? ||
             regulating_pt.pocelain_status.nil?)
        return regulating_pt
      end
    end
  end

  def hi_factor
    return nil if all_attributes_are_nil?
    RegulatingPtFactor.all.each do |i|
      i.end = 100 if i.end.nil?
      if percent_regulating_pt_factor.round.between?(i.start, i.end)
        return i.hi_factor
      end
    end
  end

  def percent_regulating_pt_factor
    return nil if all_attributes_are_nil?
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

    def all_attributes_are_nil?
      if self.oil_color.nil? || self.oil_fail.nil? || self.oil_level.nil? || self.pocelain_clean.nil? ||
         self.pocelain_status.nil?
         return true
      else
        return false
      end
    end

    def fields
      ['pocelain_status', 'pocelain_clean', 'oil_fail', 'oil_level', 'oil_color']
    end

end
