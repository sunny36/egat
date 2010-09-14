require 'spec_helper'

describe SystemLocation do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    system_location = SystemLocation.find_by_value("Step 3")
    system_location.score.should eql(3)
  end
end
