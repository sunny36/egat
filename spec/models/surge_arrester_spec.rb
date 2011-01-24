require 'spec_helper'

describe SurgeArrester do
  before(:each) do
    @surge_arrester = Factory.build(:surge_arrester)
  end  

  it "should return the correct fields given side" do    
    surge_arrester = SurgeArrester.new
    hv_fields = ['porcelain_status_hv', 'porcelain_clean_hv', 
                 'ground_connector_hv', 'surge_counter_hv']
    surge_arrester.get_fields_for(:hv).should =~ hv_fields
  end

  it "should return the correct denominator given side" do 
    surge_arrester = SurgeArrester.new
    surge_arrester.denominator(:hv).should be_close(55.0, 0.01)
    surge_arrester.denominator(:lv).should be_close(55.0, 0.01)
    surge_arrester.denominator(:tv).should be_close(55.0, 0.01)
  end

  context "AT-KT7A" do
    before(:each) do
      @surge_arrester.porcelain_status_hv = score(1, :porcelain_status_hv)
      @surge_arrester.porcelain_clean_hv = score(1, :porcelain_clean_hv)
      @surge_arrester.ground_connector_hv = score(1, :ground_connector_hv)
      @surge_arrester.surge_counter_hv = score(1, :surge_counter_hv)

      @surge_arrester.porcelain_status_lv = score(1, :porcelain_status_lv)
      @surge_arrester.porcelain_clean_lv = score(1, :porcelain_clean_lv)
      @surge_arrester.ground_connector_lv = score(1, :ground_connector_lv)
      @surge_arrester.surge_counter_lv = score(1, :surge_counter_lv)

      @surge_arrester.porcelain_status_tv = score(1, :porcelain_status_tv)
      @surge_arrester.porcelain_clean_tv = score(1, :porcelain_clean_tv)
      @surge_arrester.ground_connector_tv = score(1, :ground_connector_tv)
      @surge_arrester.surge_counter_tv = score(1, :surge_counter_tv)

      @surge_arrester.save!
    end  

    it "should return the correct numerator" do       
      @surge_arrester.numerator(:hv).should be_close(20.0, 0.01)      
      @surge_arrester.numerator(:lv).should be_close(20.0, 0.01)      
      @surge_arrester.numerator(:tv).should be_close(20.0, 0.01)      
    end

    it "should return correct %BCF" do 
      @surge_arrester.percent_surge_arrester_factor.should  
      be_close(36.3636, 0.01)
    end

    def score(value, field_name)
      VisualInspectionCondition.where(
        "name = ? AND table_name = 'surge_arresters' AND score = ?", 
        field_name.to_s, value).first.id
    end
  end


end
