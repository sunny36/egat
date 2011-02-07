require 'spec_helper'

describe RadiatorCoolingSystem do
  before(:each) do
    RadiatorCoolingSystem.send(:public, 
                               *RadiatorCoolingSystem.private_instance_methods)  
    @radiator_cooling_system = Factory.build(:radiator_cooling_system)
  end

  it "should return the correct fields" do
    radiator_cooling_system = RadiatorCoolingSystem.new
    fields = ['corrosion', 'oil_fail', 'noise_level', 'oil_pump', 'animal']
    radiator_cooling_system.fields.should =~ fields
  end


  it "should return the correct denominator" do
    radiator_cooling_system = RadiatorCoolingSystem.new
    radiator_cooling_system.denominator.should be_close(80.0, 0.01)
  end
  
  context "AT_KT7A" do
    it "should return correct %RCF" do
      @radiator_cooling_system.corrosion  = score(2, :corrosion)
      @radiator_cooling_system.animal = score(1, :animal)
      @radiator_cooling_system.oil_fail = score(1, :oil_fail)
      @radiator_cooling_system.oil_pump = score(1, :oil_pump)
      @radiator_cooling_system.noise_level = score(1, :noise_level)
      @radiator_cooling_system.percent_radiator_cooling_system_factor.should be_close(37.50, 0.01)
    end
  
    def score(value, field_name)
      VisualInspectionCondition.
        where("name = ? AND table_name = 'radiator_cooling_systems' AND score = ?",
              field_name.to_s, value).first.id
    end
  end
  
  
end
