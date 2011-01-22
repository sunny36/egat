require 'spec_helper'

describe BushingCondition do
  before(:each) do
    @bushing_condition = Factory.build(:bushing_condition)
  end  
  
  it "should return the correct fields given side" do    
    bushing_condition = BushingCondition.new
    hv_fields = ['porcelain_status_hv', 'porcelain_clean_hv', 'oil_fail_hv', 
                 'oil_level_hv', 'oil_color_hv']
    bushing_condition.get_fields_for(:hv).should =~ hv_fields
  end
  
  it "should return the correct denominator given side" do 
    bushing_condition = BushingCondition.new
    bushing_condition.denominator(:hv).should be_close(65.0, 0.01)
    bushing_condition.denominator(:lv).should be_close(65.0, 0.01)
    bushing_condition.denominator(:tv).should be_close(65.0, 0.01)
  end

  context "AT-KT7A" do
    before(:each) do
      @bushing_condition.porcelain_status_hv = score(1, :porcelain_status_hv)
      @bushing_condition.porcelain_clean_hv = score(1, :porcelain_clean_hv)
      @bushing_condition.oil_color_hv = score(2, :oil_color_hv)
      @bushing_condition.oil_level_hv = score(1, :oil_level_hv)
      @bushing_condition.oil_fail_hv = score(1, :oil_fail_hv)
      
      @bushing_condition.porcelain_status_lv = score(1, :porcelain_status_lv)
      @bushing_condition.porcelain_clean_lv = score(1, :porcelain_clean_lv)
      @bushing_condition.oil_color_lv = score(2, :oil_color_lv)
      @bushing_condition.oil_level_lv = score(1, :oil_level_lv)
      @bushing_condition.oil_fail_lv = score(1, :oil_fail_lv)
      
      @bushing_condition.porcelain_status_tv = score(1, :porcelain_status_tv)
      @bushing_condition.porcelain_clean_tv = score(1, :porcelain_clean_tv)
      @bushing_condition.oil_color_tv = score(2, :oil_color_tv)
      @bushing_condition.oil_level_tv = score(1, :oil_level_tv)
      @bushing_condition.oil_fail_tv = score(1, :oil_fail_tv)
      @bushing_condition.save!
    end  
    
    it "should return the correct numerator" do       
      @bushing_condition.numerator(:hv).should be_close(30.0, 0.01)      
      @bushing_condition.numerator(:lv).should be_close(30.0, 0.01)      
      @bushing_condition.numerator(:tv).should be_close(30.0, 0.01)      
    end
    
    it "should return correct %BCF" do 
      @bushing_condition.percent_bushing_condition_factor.should  
      be_close(46.1538, 0.01)
    end

    def score(value, field_name)
      VisualInspectionCondition.where(
        "name = ? AND table_name = 'bushing_conditions' AND score = ?", 
        field_name.to_s, value).first.id
    end
  end

  
end
