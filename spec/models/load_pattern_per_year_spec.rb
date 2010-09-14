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
  fixtures :load_pattern_per_years
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should have a score of 2 given valid attributes" do
    load_pattern_per_year = Factory(:load_pattern_per_year, 
                                    :lteq_0_pt_6 => 12,
                                    :gt_0_pt_6_and_lteq_1 => 7,
                                    :gt_1_and_lteq_1_pt_2 => 2)
    load_pattern_per_year.save
    load_pattern_per_year.load_pattern_factor.score.should eql(2)
  end

  it "shoud have a score of 1" do 
    load_pattern_per_year = Factory(:load_pattern_per_year, :lteq_0_pt_6 => 12)
    load_pattern_per_year.save
    load_pattern_per_year.load_pattern_factor.score.should eql(1)
  end
end
