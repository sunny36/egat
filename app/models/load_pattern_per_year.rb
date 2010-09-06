# == Schema Information
# Schema version: 20100906080424
#
# Table name: load_pattern_per_years
#
#  id                         :integer         not null, primary key
#  lteq_0_pt_6                :integer
#  gt_0_pt_6_and_lteq_1       :integer
#  gt_1_and_lteq_1_pt_2       :integer
#  gt_1_pt_2_and_lteq_1_pt_5  :integer
#  gt_1_pt_5                  :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#  transformer_information_id :integer
#  load_pattern_factor_id     :integer
#

class LoadPatternPerYear < ActiveRecord::Base
  belongs_to :transformer_information
  belongs_to :load_pattern_factor
  before_save :assign_score
  
  protected
  def assign_score
    unless self.lpf_numerator.to_f.zero?
      lpf = (self.lpf_numerator.to_f / self.lpf_denominator) * 100.to_f
    else 
      lpf = 0.0
    end
    
    #Get all LoadPatternFactor that contain some values in start or end. 
    load_pattern_factor = LoadPatternFactor.find(:all, :conditions => ["start >=0 or end >=0"])
    load_pattern_factor.each do |i|
      i.end = 100 if i.end.nil? # If end is nil means it does not have an upper bound
      if lpf.between?(i.start, i.end)
        self.load_pattern_factor_id = i.id
      end        
    end
  end
  
  def lpf_numerator
    (1 * self.lteq_0_pt_6) + (2 * self.gt_0_pt_6_and_lteq_1) + 
    (3 * self.gt_1_and_lteq_1_pt_2) + (4 * self.gt_1_pt_2_and_lteq_1_pt_5) +
    (5 * self.gt_1_pt_5)
  end
  
  def lpf_denominator
    5 * (self.lteq_0_pt_6 + self.gt_0_pt_6_and_lteq_1 + 
         self.gt_1_and_lteq_1_pt_2 + self.gt_1_pt_2_and_lteq_1_pt_5 + 
         self.gt_1_pt_5)
  end
end
