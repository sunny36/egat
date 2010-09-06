require 'spec_helper'

describe LoadPatternFactor do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should have 4 rows" do
    LoadPatternFactor.all.count.should eql(6)
  end
end
