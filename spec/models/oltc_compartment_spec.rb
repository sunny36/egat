require 'spec_helper'

describe OltcCompartment do
  before(:each) do
    OltcCompartment.send(:public, *OltcCompartment.private_instance_methods)  
    @oltc_compartment = Factory.build(:oltc_compartment)
  end

  it "should return the correct fields" do
    oltc_compartment = OltcCompartment.new
    oltc_compartment.fields.should =~ ['corrosion', 'oil_fail']
  end


  it "should return the correct denominator" do
    oltc_compartment = OltcCompartment.new
    oltc_compartment.denominator.should be_close(35.0, 0.01)
  end
  
  context "AT_KT7A" do
    it "should return correct %HLF" do
      @oltc_compartment.corrosion  = score(1, :corrosion)
      @oltc_compartment.oil_fail = score(1, :oil_fail)
      @oltc_compartment.percent_oltc_compartment_factor.should be_close(28.57, 0.01)
    end

    def score(value, field_name)
      VisualInspectionCondition.
        where("name = ? AND table_name = 'oltc_compartments' AND score = ?",
              field_name.to_s, value).first.id
    end
  end
end

# == Schema Information
#
# Table name: oltc_compartments
#
#  id                   :integer(4)      not null, primary key
#  corrosion            :integer(10)
#  oil_fail             :integer(10)
#  visual_inspection_id :integer(4)
#

