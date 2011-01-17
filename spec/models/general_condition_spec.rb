require 'spec_helper'

describe GeneralCondition do
  before(:each) do
    @general_condition = Factory.build(:general_condition)
  end

  it "should return the correct denominator" do
    @general_condition.save!
    @general_condition.denominator.should be_close(90.0, 0.01)
  end

  context "AT_KT7A" do
    it "should return correct %GCF" do
      @general_condition.maxload = score(1, :maxload)
      @general_condition.sound = score(1, :sound)
      @general_condition.vibration = score(1, :vibration)
      @general_condition.ground_connector = score(1, :ground_connector)
      @general_condition.foundation = score(1, :foundation)
      @general_condition.animal_protect = score(1, :animal_protect)
      @general_condition.percent_general_condition_factor.should be_close(33.33, 0.01)
    end

    def score(value, field_name)
      VisualInspectionCondition.
      where("name = ? AND table_name = 'general_conditions' AND score = 1", field_name.to_s).first.id
    end
  end

end
