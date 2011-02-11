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

  def hi_factor
    NgrFactor.all.each do |i|
      i.end = 100 if i.end.nil?
      if percent_ngr_factor.round.between?(i.start, i.end)
        return i.hi_factor
      end
    end
  end

  def percent_ngr_factor
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

    def fields
      ['base_status', 'ground_connector', 'ngr_status', 'pocelain_clean']
    end
end
