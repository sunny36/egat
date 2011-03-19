require 'spec_helper'

describe InsulatingOilFactor do
  before(:each) do
    @oil_quality  = OilQuality.new
    InsulatingOil.any_instance.stubs(:xi_average_maintank => 26.0, :avg_percent_power_factor_maintank => 2.14,
                                     :cor_percent_power_factor_maintank => 6,
                                     :transformer_id => 1)
    InsulatingOil.any_instance.stubs(:transformer).returns(Transformer.find(1))
    @insulating_oil = InsulatingOil.new
    OilContamination.any_instance.stubs(:ift => 25.0, :nn => 0.1, :water_content => 38, :color => 1.8, :transformer_id => 1)
    OilContamination.any_instance.stubs(:transformer).returns(Transformer.find(1))
    @oil_contamination = OilContamination.new
  end
  
  it "should return the correct percent HI for Insulating Oil" do
    InsulatingOilFactor.percent_hi(@insulating_oil, @oil_contamination).should be_close(0, 0.01)
  end
end
