require 'spec_helper'

describe HotLineOilFilter do
  before(:each) do
    HotLineOilFilter.send(:public, *HotLineOilFilter.private_instance_methods)  
    @hot_line_oil_filter = Factory.build(:hot_line_oil_filter)
  end

  it "should return the correct fields" do
    hot_line_oil_filter = HotLineOilFilter.new
    hot_line_oil_filter.fields.should =~ ['corrosion', 'pressure']
  end


  it "should return the correct denominator" do
    hot_line_oil_filter = HotLineOilFilter.new
    hot_line_oil_filter.denominator.should be_close(30.0, 0.01)
  end
  
  context "AT_KT7A" do
    it "should return correct %HLF" do
      @hot_line_oil_filter.corrosion  = score(1, :corrosion)
      @hot_line_oil_filter.pressure = score(1, :pressure)
      @hot_line_oil_filter.percent_hot_line_oil_filter_factor.should be_close(33.33, 0.01)
    end

    def score(value, field_name)
      VisualInspectionCondition.
        where("name = ? AND table_name = 'hot_line_oil_filters' AND score = ?",
              field_name.to_s, value).first.id
    end
  end
  
  
end
