require 'spec_helper'

describe Ngr do
  before(:each) do
    Ngr.send(:public, *Ngr.private_instance_methods)  
    @ngr = Factory.build(:ngr)
  end

  it "should return the correct fields" do
    ngr = Ngr.new
    fields = ['base_status', 'ground_connector', 'ngr_status', 'pocelain_clean']
    ngr.fields.should =~ fields
  end


  it "should return the correct denominator" do
    ngr = Ngr.new
    ngr.denominator.should be_close(70.0, 0.01)
  end
  
  context "AT_KT7A" do
    it "should return correct %NGRF" do
      @ngr.base_status  = score(1, :base_status)
      @ngr.ground_connector = score(1, :ground_connector)
      @ngr.ngr_status = score(1, :ngr_status)
      @ngr.pocelain_clean = score(1, :pocelain_clean)
      @ngr.percent_ngr_factor.should be_close(28.57, 0.01)
    end
  
    def score(value, field_name)
      VisualInspectionCondition.
        where("name = ? AND table_name = 'ngrs' AND score = ?", field_name.to_s, 
              value).first.id
    end
  end
  
  
end
