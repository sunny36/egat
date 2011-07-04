require 'spec_helper'

describe OltcControlCabinet do
  before(:each) do
    OltcControlCabinet.send(:public, *OltcControlCabinet.private_instance_methods)
    @oltc_control_cabinet = Factory.build(:oltc_control_cabinet)
  end

  it "should return the correct fields" do
    oltc_control_cabinet = OltcControlCabinet.new
    fields = ['corrosion', 'animal', 'control_humidity', 'pragen',
              'wiring_control']
    oltc_control_cabinet.fields.should =~ fields
  end


  it "should return the correct denominator" do
    oltc_control_cabinet = OltcControlCabinet.new
    oltc_control_cabinet.denominator.should be_close(70.0, 0.01)
  end

  context "AT_KT7A" do
    it "should return correct %HLF" do
      @oltc_control_cabinet.corrosion  = score(1, :corrosion)
      @oltc_control_cabinet.animal = score(1, :animal)
      @oltc_control_cabinet.control_humidity = score(1, :control_humidity)
      @oltc_control_cabinet.pragen = score(2, :pragen)
      @oltc_control_cabinet.wiring_control = score(1, :wiring_control)
      @oltc_control_cabinet.percent_oltc_control_cabinet_factor.
        should be_close(42.86, 0.01)
    end

    def score(value, field_name)
      VisualInspectionCondition.
        where("name = ? AND table_name = 'oltc_control_cabinets' AND score = ?",
              field_name.to_s, value).first.id
    end
  end
end

# == Schema Information
#
# Table name: oltc_control_cabinets
#
#  id                   :integer(4)      not null, primary key
#  animal               :integer(10)
#  control_humidity     :integer(10)
#  corrosion            :integer(10)
#  pragen               :integer(10)
#  wiring_control       :integer(10)
#  visual_inspection_id :integer(4)
#

