require 'spec_helper'
#  lteq_0_pt_6                :integer
#  gt_0_pt_6_and_lteq_1       :integer
#  gt_1_and_lteq_1_pt_2       :integer
#  gt_1_pt_2_and_lteq_1_pt_5  :integer
#  gt_1_pt_5                  :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#  transformer_information_id :integer
#  load_pattern_factor_id     :integer

describe LoadPatternPerYear do
  before(:each) do
    @valid_attributes = {
      :lteq_0_pt_6 => 3, 
      :gt_0_pt_6_and_lteq_1 => 7, 
      :gt_1_and_lteq_1_pt_2 => 2, 
      :gt_1_pt_2_and_lteq_1_pt_5 => 0, 
      :gt_1_pt_5 => 0      
    }
  end

  it "should create a new instance given valid attributes" do
    LoadPatternPerYear.create!(@valid_attributes)
  end
  
  it "should have a score of 2 given valid attributes" do
    load_pattern_per_year = LoadPatternPerYear.create!(@valid_attributes)
    load_pattern_per_year.load_pattern_factor.score.should eql(2)
  end
end
