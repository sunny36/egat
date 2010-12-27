# == Schema Information
# Schema version: 20101205200640
#
# Table name: load_pattern_per_years
#
#  id                         :integer(4)      not null, primary key
#  lteq_0_pt_6                :integer(4)
#  gt_0_pt_6_and_lteq_1       :integer(4)
#  gt_1_and_lteq_1_pt_2       :integer(4)
#  gt_1_pt_2_and_lteq_1_pt_5  :integer(4)
#  gt_1_pt_5                  :integer(4)
#  created_at                 :datetime
#  updated_at                 :datetime
#  transformer_information_id :integer(4)
#  load_pattern_factor_id     :integer(4)
#

class LoadPatternPerYear < ActiveRecord::Base
  belongs_to :transformer_information
  belongs_to :load_pattern_factor
  before_save :assign_score
  validate :sum_must_not_more_than_12_months

  protected

  def sum_must_not_more_than_12_months
    sum = lteq_0_pt_6 + gt_0_pt_6_and_lteq_1 + gt_1_and_lteq_1_pt_2 + 
          gt_1_pt_2_and_lteq_1_pt_5 + gt_1_pt_5
    if sum > 12
      errors.add_to_base("Sum of Load Pattern should not exceed 12 months")
    end
  end

  def assign_score
    unless self.lpf_numerator.to_f.zero?
      lpf = (self.lpf_numerator.to_f / self.lpf_denominator) * 100.to_f
    else 
      lpf = 0.0
    end
    #Get all LoadPatternFactor that contain some values in start or end. 
    load_pattern_factor = LoadPatternFactor.where("start >=0 or end >=0").all
    load_pattern_factor.each do |i|
      # If end is nil means it does not have an upper bound
      i.end = 100 if i.end.nil? 
      if lpf.between?(i.start, i.end)
        self.load_pattern_factor_id = i.id
      end        
    end
  end

  def lpf_numerator
    (1 * self.lteq_0_pt_6) + 
      (2 * self.gt_0_pt_6_and_lteq_1) + 
      (3 * self.gt_1_and_lteq_1_pt_2) + 
      (4 * self.gt_1_pt_2_and_lteq_1_pt_5) +
      (5 * self.gt_1_pt_5)
  end

  def lpf_denominator
    5 * (self.lteq_0_pt_6 + self.gt_0_pt_6_and_lteq_1 + 
         self.gt_1_and_lteq_1_pt_2 + self.gt_1_pt_2_and_lteq_1_pt_5 + 
         self.gt_1_pt_5)
  end
  
  def percentage
    unless self.lpf_numerator.to_f.zero?
      lpf = (self.lpf_numerator.to_f / self.lpf_denominator) * 100.to_f
    else 
      lpf = 0.0
    end
    return lpf
  end
end
