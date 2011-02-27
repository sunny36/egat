require 'spec_helper'

describe OilQuality do
  before(:each) do
    @oil_quality  = OilQuality.new
    InsulatingOil.any_instance.stubs(:xi_average_maintank => 79.08, :transformer_id => 1)
    InsulatingOil.any_instance.expects(:transformer).returns(Transformer.find(1))
    @insulating_oil = InsulatingOil.new
    OilContamination.any_instance.stubs(:ift => 0, :nn => 0, :water_content => 14, :color => 1, :transformer_id => 1)
    OilContamination.any_instance.expects(:transformer).returns(Transformer.find(1))
    @oil_contamination = OilContamination.new        
  end

  it "should return the correct value for denominator" do
    @oil_quality.denominator.should eql(48)
  end
  
  it "should return the correct score for xbar" do
    @oil_quality.dielectric_breakdown_score(@insulating_oil).should eql(1)
  end
  
  it "should return the correct score for ift" do
    @oil_quality.ift_score(@oil_contamination).should eql(4)
  end

  it "should return the correct score for nn" do
    @oil_quality.nn_score(@oil_contamination).should eql(1)
  end

  it "should return the correct score for water_content" do
    @oil_quality.water_content_score(@oil_contamination).should eql(2)
  end

  it "should return the correct score for color" do
    @oil_quality.color_score(@oil_contamination).should eql(1)
  end
  
  it "should return the correct value for %OOQ Factor" do
    @oil_quality.percent_oil_quality_factor(@insulating_oil, @oil_contamination).should be_close(45.83, 0.01)
  end
  
  it "should return the correct HIF" do
    #@oil_quality.hi_factor(@insulating_oil, @oil_contamination).should eql(1)
  end
  
end
