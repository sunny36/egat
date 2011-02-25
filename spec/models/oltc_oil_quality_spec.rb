require 'spec_helper'

describe OltcOilQuality do
  before(:each) do
    @oltc_oil_quality  = OltcOilQuality.new
    InsulatingOil.any_instance.stubs(:xi_average_oltc => 40, :transfromer_id => 1)
    InsulatingOil.any_instance.expects(:transformer).returns(Transformer.find(1))
    @insulating_oil = InsulatingOil.new
    OltcOilContamination.any_instance.stubs(:water_content => 35, :color => 0.9)
    @oltc_oil_contamination = OltcOilContamination.new
  end

  it "should return the correct value for denominator" do
    @oltc_oil_quality.denominator.should eql(42)
  end

  it "should return the correct score for xbar" do
    @oltc_oil_quality.dielectric_breakdown_score(@insulating_oil).should eql(2)
  end

  it "should return the correct score for water_content" do
    @oltc_oil_quality.water_content_score(@oltc_oil_contamination).should eql(3)
  end

  it "should return the correct score for color" do
    @oltc_oil_quality.color_score(@oltc_oil_contamination).should eql(1)
  end

  it "should return the correct value for numerator" do
    @oltc_oil_quality.numerator(@insulating_oil, @oltc_oil_contamination).should be_close(20.0, 0.01)
  end

  it "should return the correct value for %OOQ Factor" do
    @oltc_oil_quality.percent_oltc_oil_quality_factor(@insulating_oil,
                                                      @oltc_oil_contamination).should be_close(47.62, 0.01)
  end
  
  it "should return the correct HIF" do
    @oltc_oil_quality.hi_factor(@insulating_oil, @oltc_oil_contamination).should eql(1)
  end
end
