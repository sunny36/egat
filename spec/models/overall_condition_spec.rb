require 'spec_helper'

describe OverallCondition do

  before(:each) do
    @overall_condition = OverallCondition.new(1)
  end

  it "should return correct scores for overall condition" do 
    @overall_condition.oil_dga.hi_factor.should eql(4)
    @overall_condition.visual_inspection.general_condition.load_history_hi_factor.should eql(3)
    @overall_condition.power_factor_hi_factor.should eql(0)
    @overall_condition.thermo_scan.hi_factor.should eql(2)
    @overall_condition.oil_quality_hi_factor.should eql(0)
    @overall_condition.furan_hi_factor.should eql(2)
    @overall_condition.visual_inspection.general_condition.hi_factor.should eql(3)
    @overall_condition.visual_inspection.bushing_condition.hi_factor.should eql(2)
    @overall_condition.visual_inspection.surge_arrester.hi_factor.should eql(0)
    @overall_condition.visual_inspection.conservator_tank.hi_factor.should eql(0)
    @overall_condition.visual_inspection.main_tank.hi_factor.should eql(0)
    @overall_condition.visual_inspection.hot_line_oil_filter.hi_factor.should eql(0)
    @overall_condition.visual_inspection.radiator_cooling_system.hi_factor.should eql(3)
    @overall_condition.visual_inspection.transformer_control_cabinet.hi_factor.should eql(3)
    @overall_condition.visual_inspection.ngr.hi_factor.should eql(0)
    @overall_condition.visual_inspection.regulating_pt.hi_factor.should eql(0)
    @overall_condition.visual_inspection.oltc_compartment.hi_factor.should eql(2)
    @overall_condition.visual_inspection.oltc_control_cabinet.hi_factor.should eql(0)
    @overall_condition.oltc_dga_hi_factor.should eql(4)
    @overall_condition.oltc_oil_quality_hi_factor.should eql(0)
  end

  it "should return correct Hi Factor Others" do
    @overall_condition.percent_hi_others.should be_close(45.26, 0.01)
  end

  it "should return correct HI Factor OLTC" do
    @overall_condition.percent_hi_oltc.should be_close(59.09, 0.01)
  end
  
  it "should return correct %HI" do
    @overall_condition.percent_overall_health_index.should be_close(50.79, 0.01)
  end
end
