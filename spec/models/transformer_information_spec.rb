require 'spec_helper'

describe TransformerInformation do
  fixtures :transformer_informations
  before(:each) do
    TransformerInformation.send(
      :public, 
      *TransformerInformation.protected_instance_methods) 
    @valid_attributes = {
    }
  end

  it "should return correct BusVoltageHv value" do
    transformer_information = Factory.create(:transformer_information)
    #debugger
    #TransformerInformation.new(transformer_information)
    #transformer_information.bus_voltage_hv.value.should eql("115")
  end
  
  #it "should return System Fault Level Hv MVA" do 
    #transformer_information = Factory.create(:transformer_information) 
    #system_fault_level_hv_mva = 
      #transformer_information.system_fault_level_hv_mva
    #system_fault_level_hv_mva.should be_close(381.4297, 0.1)
  #end
  
  #it "should return System Fault Level Lv MVA" do 
    #transformer_information = Factory.create(:transformer_information) 
    #system_fault_level_lv_mva = 
      #transformer_information.system_fault_level_lv_mva
    #system_fault_level_lv_mva.should be_close(202.0159, 0.1)
  #end
  
  #it "should return System Fault Level Hv Score" do
    #@transformer_information = transformer_informations(:one)
    ##@transformer_information.system_fault_level_hv_score.should eql(3)
  #end
  
  #it "should return System Fault Level Lv Score" do
    #@transformer_information = transformer_informations(:one)
    ##@transformer_information.system_fault_level_lv_score.should eql(1)
  #end

  #it "should return System Fault Level Score" do
    #transformer_information = Factory.create(:transformer_information) 
    #transformer_information.system_fault_level_score.should eql(1)
  #end
  
end
