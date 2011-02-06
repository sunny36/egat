require 'spec_helper'

describe ConservatorTank do

  before(:each) do
    ConservatorTank.send(:public, *ConservatorTank.private_instance_methods)  
    @conservator_tank = Factory.build(:conservator_tank)
  end

  it "should return the correct fields" do
    conservator_tank = ConservatorTank.new
    fields = ['corrosion_oltc', 'oilfail_oltc', 'oil_level_oltc',
              'jel_color_oltc', 'breather_oltc', 'corrosion_maintank',
              'oilfail_maintank', 'oil_level_maintank', 'jel_color_maintank',
              'breather_maintank']
    conservator_tank.fields.should =~ fields
  end


  it "should return the correct denominator" do
    conservator_tank = ConservatorTank.new
    conservator_tank.denominator.should be_close(160.0, 0.01)
  end

  context "AT_KT7A" do
    it "should return correct %CTF" do
      @conservator_tank.corrosion_maintank  = score(1, :corrosion_maintank)
      @conservator_tank.oilfail_maintank = score(1, :oilfail_maintank)
      @conservator_tank.oil_level_maintank = score(1, :oil_level_maintank)
      @conservator_tank.jel_color_maintank = score(1, :jel_color_maintank)
      @conservator_tank.breather_maintank = score(1, :breather_maintank)

      @conservator_tank.corrosion_oltc  = score(1, :corrosion_oltc)
      @conservator_tank.oilfail_oltc = score(1, :oilfail_oltc)
      @conservator_tank.oil_level_oltc = score(1, :oil_level_oltc)
      @conservator_tank.jel_color_oltc = score(1, :jel_color_oltc)
      @conservator_tank.breather_oltc = score(1, :breather_oltc)
      @conservator_tank.percent_conservator_tank_factor.should be_close(31.25, 0.01)
    end

    def score(value, field_name)
      VisualInspectionCondition.
        where("name = ? AND table_name = 'conservator_tanks' AND score = ?",
              field_name.to_s, value).first.id
    end
  end

end
