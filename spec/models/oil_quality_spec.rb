require 'spec_helper'

describe OilQuality do
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

  it "should return the correct value for denominator" do
    @oil_quality.denominator.should eql(48)
  end

  it "should return the correct score for xbar" do
    @oil_quality.dielectric_breakdown_score(@insulating_oil).should eql(3)
  end

  it "should return the correct score for ift" do
    @oil_quality.ift_score(@oil_contamination).should eql(3)
  end

  it "should return the correct score for nn" do
    @oil_quality.nn_score(@oil_contamination).should eql(2)
  end

  it "should return the correct score for water_content" do
    @oil_quality.water_content_score(@oil_contamination).should eql(4)
  end

  it "should return the correct score for color" do
    @oil_quality.color_score(@oil_contamination).should eql(2)
  end

  it "should return the correct value for %OOQ Factor" do
    @oil_quality.percent_oil_quality_factor(@insulating_oil, @oil_contamination).should be_close(77.08, 0.01)
  end

  it "should return the correct HIF" do
    @oil_quality.hi_factor(@insulating_oil, @oil_contamination, :oil_quality).should eql(0)
  end

  it "should return the correct score for Power Factor @ 20C" do
    @oil_quality.power_factor_score(@insulating_oil, :twenty_degrees).should eql(4)
  end

  it "should return the correct score for Power Factor @ 100C" do
    @oil_quality.power_factor_score(@insulating_oil, :hundred_degrees).should eql(3)
  end
  
  it "should return the correct %CF Factor" do
    @oil_quality.percent_contamination_factor(@insulating_oil, @oil_contamination).should be_close(79.69, 0.01)
  end
  
  it "should return the correct HIF for Oil Contamination" do
    @oil_quality.hi_factor(@insulating_oil, @oil_contamination, :contamination).should eql(0)
  end
  
end

# == Schema Information
#
# Table name: oil_qualities
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  u_start    :integer(4)
#  u_end      :integer(4)
#  start      :float
#  end        :float
#  score      :integer(4)
#  weight     :integer(4)
#  color_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

