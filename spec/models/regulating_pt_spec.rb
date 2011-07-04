require 'spec_helper'

describe RegulatingPt do
  before(:each) do
    RegulatingPt.send(:public, *RegulatingPt.private_instance_methods)  
    @regulating_pt = Factory.build(:regulating_pt)
  end

  it "should return the correct fields" do
    regulating_pt = RegulatingPt.new
    fields = ['pocelain_status', 'pocelain_clean', 'oil_fail', 'oil_level', 
              'oil_color']
    regulating_pt.fields.should =~ fields
  end


  it "should return the correct denominator" do
    regulating_pt = RegulatingPt.new
    regulating_pt.denominator.should be_close(65.0, 0.01)
  end
  
  context "AT_KT7A" do
    it "should return correct %PTF" do
      @regulating_pt.pocelain_status  = score(1, :pocelain_status)
      @regulating_pt.pocelain_clean = score(1, :pocelain_clean)
      @regulating_pt.oil_fail = score(1, :oil_fail)
      @regulating_pt.oil_level = score(1, :oil_level)
      @regulating_pt.oil_color = score(1, :oil_color)
      @regulating_pt.percent_regulating_pt_factor.should be_close(38.46, 0.01)
    end
  
    def score(value, field_name)
      VisualInspectionCondition.
        where("name = ? AND table_name = 'regulating_pts' AND score = ?", 
              field_name.to_s, value).first.id
    end
  end
  
end

# == Schema Information
#
# Table name: regulating_pts
#
#  id                   :integer(4)      not null, primary key
#  oil_color            :integer(10)
#  oil_fail             :integer(10)
#  oil_level            :integer(10)
#  pocelain_clean       :integer(10)
#  pocelain_status      :integer(10)
#  visual_inspection_id :integer(4)
#

