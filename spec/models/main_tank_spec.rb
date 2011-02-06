require 'spec_helper'

describe MainTank do
  
  before(:each) do
    MainTank.send(:public, *MainTank.private_instance_methods)  
    @main_tank = Factory.build(:main_tank)
  end
  
  it "should return the correct fields" do
    main_tank = MainTank.new
    fields = ['corrosion', 'oil_fail']
    main_tank.fields.should =~ fields
  end
  
  it "should return the correct denominator" do
    main_tank = MainTank.new
    main_tank.denominator.should be_close(35.0, 0.01)
  end
  
  context "AT_KT7A" do
    it "should return correct %MTF" do
      @main_tank.corrosion  = score(1, :corrosion)
      @main_tank.oil_fail = score(1, :oil_fail)
      @main_tank.percent_main_tank_factor.should be_close(28.57, 0.01)
    end

    def score(value, field_name)
      VisualInspectionCondition.
        where("name = ? AND table_name = 'main_tanks' AND score = ?",
              field_name.to_s, value).first.id
    end
  end
  
end
