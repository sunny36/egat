require 'spec_helper'
describe TransformerInformation do
  fixtures :transformer_informations
  before(:each) do
    TransformerInformation.send(:public, *TransformerInformation.protected_instance_methods) 
    @valid_attributes = {
    }
  end

  it "should return correct BusVoltageHv value" do
    @transformer_information = transformer_informations(:one)
    @transformer_information.bus_voltage_hv.value.should eql("230")
  end
  
  it "should return System Fault Level Hv MVA" do 
    @transformer_information = transformer_informations(:one)
    @transformer_information.system_fault_level_hv_mva.should be_close(17663.2824, 0.1)
  end
  
  it "should return System Fault Level Lv MVA" do 
    @transformer_information = transformer_informations(:one)
    @transformer_information.system_fault_level_lv_mva.should be_close(701.1136, 0.1)
  end
  
  it "should return System Fault Level Hv Score" do
    @transformer_information = transformer_informations(:one)
    @transformer_information.system_fault_level_hv_score.should eql(3)
  end
  
  it "should return System Fault Level Lv Score" do
    @transformer_information = transformer_informations(:one)
    @transformer_information.system_fault_level_lv_score.should eql(1)
  end

  it "should return System Fault Level Score" do
    @transformer_information = transformer_informations(:one)
    @transformer_information.system_fault_level_score.should eql(3)
  end
  
end
