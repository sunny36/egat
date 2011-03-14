require 'spec_helper'

describe AgingProduct do
  before(:each) do
    @aging_product  = AgingProduct.new
    OilContamination.any_instance.stubs(:ift => 25.0, :nn => 0.1, :water_content => 38, :color => 1.8,
                                        :transformer_id => 1)
    OilContamination.any_instance.stubs(:transformer).returns(Transformer.find(1))
    @oil_contamination = OilContamination.new
  end

  it "should return the correct value for denominator" do
    @aging_product.denominator.should eql(20)
  end
  
  it "should return the correct value for numerator" do
    @aging_product.numerator(@oil_contamination).should be_close(10, 0.01)
  end

  it "should return the correct %APF " do
    @aging_product.percent_aging_product_factor(@oil_contamination).should be_close(50.0, 0.01)
  end

end
