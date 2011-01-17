require 'spec_helper'

describe VisualInspectionCondition do
  it "should return the correct weight" do
    VisualInspectionCondition.weight(:maxload, :general_conditions).should eql(5)
    VisualInspectionCondition.weight(:sound, :general_conditions).should eql(5)
    VisualInspectionCondition.weight(:vibration, :general_conditions).should eql(5)
    VisualInspectionCondition.weight(:ground_connector, :general_conditions).should eql(5)
    VisualInspectionCondition.weight(:foundation, :general_conditions).should eql(5)
    VisualInspectionCondition.weight(:animal_protect, :general_conditions).should eql(5)
  end
end
