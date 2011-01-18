require 'spec_helper'

describe BushingCondition do
  before(:each) do
  end  
  
  it "should return the correct fields given side" do    
    bushing_condition = BushingCondition.new
    hv_fields = ['porcelain_status_hv', 'porcelain_clean_hv', 'oil_fail_hv', 
                 'oil_level_hv', 'oil_color_hv']
    bushing_condition.get_fields_for(:hv).should =~ hv_fields
  end
  
  it "should return the correct denominator given side" do 
    bushing_condition = BushingCondition.new
    bushing_condition.denominator(:hv).should be_close(90.0, 0.01)
  end
  
end
