require 'spec_helper'

describe ProbabilityOfForceOutage do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should return score of 1 when value is AA" do
    @probability_of_force_outage = ProbabilityOfForceOutage.find_by_value("AA")
    @probability_of_force_outage.score.should eql(1)
  end
  
  it "should return score of 2 when value is BB" do
    @probability_of_force_outage = ProbabilityOfForceOutage.find_by_value("BB")
    @probability_of_force_outage.score.should eql(2)
  end

  it "should return score of 3 when value is CC" do
    @probability_of_force_outage = ProbabilityOfForceOutage.find_by_value("CC")
    @probability_of_force_outage.score.should eql(3)
  end

  it "should return score of 4 when value is DD" do
    @probability_of_force_outage = ProbabilityOfForceOutage.find_by_value("DD")
    @probability_of_force_outage.score.should eql(4)    
  end

  it "should return score of 5 when value is EE" do
    @probability_of_force_outage = ProbabilityOfForceOutage.find_by_value("EE")
    @probability_of_force_outage.score.should eql(5)    
  end
  
end
