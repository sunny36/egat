require 'spec_helper'

describe VisualInspectionCondition do
  context "GeneralCondition" do 
    it "should return the correct weight" do
      VisualInspectionCondition.weight(:maxload, :general_conditions).
        should eql(5)
      VisualInspectionCondition.weight(:sound, :general_conditions).
        should eql(5)
      VisualInspectionCondition.weight(:vibration, :general_conditions).
        should eql(5)
      VisualInspectionCondition.weight(:ground_connector, :general_conditions).
        should eql(5)
      VisualInspectionCondition.weight(:foundation, :general_conditions).
        should eql(5)
      VisualInspectionCondition.weight(:animal_protect, :general_conditions).
        should eql(5)
    end

    it "should return the correct maximum score" do
      VisualInspectionCondition.max_score(:maxload, :general_conditions).
        should eql(5)
      VisualInspectionCondition.max_score(:sound, :general_conditions).
        should eql(2)
      VisualInspectionCondition.max_score(:vibration, :general_conditions).
        should eql(2)
      VisualInspectionCondition.max_score(:ground_connector, :general_conditions).
        should eql(3)
      VisualInspectionCondition.max_score(:foundation, :general_conditions).
        should eql(3)
      VisualInspectionCondition.max_score(:animal_protect, :general_conditions).
        should eql(3)
    end    
  end
  
  context "Bushing Condition" do 
    it "should return the correct weight" do 
      hv_fields = ['porcelain_status_hv', 'porcelain_clean_hv', 'oil_fail_hv', 
                   'oil_level_hv', 'oil_color_hv']
      hv_fields.each do |item|
        VisualInspectionCondition.weight(item, :bushing_conditions).should eql(5)
      end
      
    end
  end

  context "Surge Arrester" do 
    it "should return the correct weight" do 
    hv_fields = ['porcelain_status_hv', 'porcelain_clean_hv', 
                 'ground_connector_hv', 'surge_counter_hv']
      hv_fields.each do |item|
        VisualInspectionCondition.weight(item, :surge_arresters).should eql(5)
      end
      
    end
  end

end

# == Schema Information
#
# Table name: visual_inspection_conditions
#
#  id                   :integer(4)      not null, primary key
#  description          :string(255)
#  start                :integer(4)
#  end                  :integer(4)
#  condition            :string(255)
#  name                 :string(255)
#  table_name           :string(255)
#  score                :integer(4)
#  score_message        :string(255)
#  weight               :integer(4)
#  visual_inspection_id :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#

