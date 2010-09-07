require 'spec_helper'

describe BusVoltage do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should return the correct set of System Fault Level" do
    @system_fault_levels = BusVoltage.system_fault_level(230)
    
    @system_fault_levels.first.start.should eql(0)
    @system_fault_levels.first.end.should eql(10000)
    
    @system_fault_levels.second.start.should eql(10001)
    @system_fault_levels.second.end.should eql(16600)

    @system_fault_levels.third.start.should eql(16601)
    @system_fault_levels.third.end.should eql(23200)

    @system_fault_levels.fourth.start.should eql(23201)
    @system_fault_levels.fourth.end.should eql(30000)

    @system_fault_levels.fifth.start.should eql(30001)
    @system_fault_levels.fifth.end.should eql(nil)    
    
    @system_fault_levels = BusVoltage.system_fault_level(115)
    
    @system_fault_levels.first.start.should eql(0)
    @system_fault_levels.first.end.should eql(1000)
    
    @system_fault_levels.second.start.should eql(1001)
    @system_fault_levels.second.end.should eql(2300)

    @system_fault_levels.third.start.should eql(2301)
    @system_fault_levels.third.end.should eql(3600)

    @system_fault_levels.fourth.start.should eql(3601)
    @system_fault_levels.fourth.end.should eql(5000)

    @system_fault_levels.fifth.start.should eql(5001)
    @system_fault_levels.fifth.end.should eql(nil)        
  end
end
