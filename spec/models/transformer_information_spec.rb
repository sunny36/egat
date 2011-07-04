require 'spec_helper'

describe TransformerInformation do
  # context "PKC-KT1A" do 
  #   it "should return correct Load Patter Score" do
  #     transformer = Transformer.find_by_transformer_name('PKC-KT1A')
  #     transformer_information = TransformerInformation.find_by_transformer_id(transformer.id)
  #     transformer_information.load_pattern_per_year.load_pattern_factor.score.should eql(1)
  #     transformer_information.system_location.score.should eql(3)
  #     transformer_information.n1_criteria.score.should eql(1)
  #     transformer_information.system_stability.score.should eql(1)
  #     transformer_information.application_use.score.should eql(4)
  #     transformer_information.probability_of_force_outage(:score).should eql(1)
  #     transformer_information.damage_of_property_score.should eql(2)
  #     transformer_information.social_aspect.score.should eql(3)
  #     transformer_information.public_image.score.should eql(5)
  #     transformer_information.pollution.score.should eql(3)
  #     transformer_information.transformer.brand.score.should eql(4) 
  #     transformer_information.denominator.should eql(191)
  #     transformer_information.importance_index.should be_close(39.79, 0.01)
  #   end    
  # end
  # 
  # context "PKC-KT2A" do 
  #   it "should return correct results" do
  #     transformer = Transformer.find_by_transformer_name('PKC-KT2A')
  #     transformer_information = TransformerInformation.find_by_transformer_id(transformer.id)
  #     transformer_information.load_pattern_per_year.load_pattern_factor.score.should eql(1)
  #     transformer_information.system_location.score.should eql(3)
  #     transformer_information.n1_criteria.score.should eql(1)
  #     transformer_information.system_stability.score.should eql(1)
  #     transformer_information.application_use.score.should eql(4)
  #     transformer_information.probability_of_force_outage(:score).should eql(1)
  #     transformer_information.damage_of_property_score.should eql(2)
  #     transformer_information.social_aspect.score.should eql(3)
  #     transformer_information.public_image.score.should eql(5)
  #     transformer_information.pollution.score.should eql(3)
  #     transformer_information.transformer.brand.score.should eql(5) 
  #     transformer_information.denominator.should eql(191)
  #     transformer_information.importance_index.should be_close(40.84, 0.01)
  #   end    
  # end
  # 
  # context "KN-KT3A" do 
  #   it "should return correct results" do
  #     transformer = Transformer.find_by_transformer_name('KN-KT3A')
  #     transformer_information = TransformerInformation.find_by_transformer_id(transformer.id)
  #     transformer_information.load_pattern_per_year.load_pattern_factor.score.should eql(1)
  #     transformer_information.system_location.score.should eql(3)
  #     transformer_information.n1_criteria.score.should eql(5)
  #     transformer_information.system_stability.score.should eql(1)
  #     transformer_information.application_use.score.should eql(4)
  #     transformer_information.probability_of_force_outage(:score).should eql(3)
  #     transformer_information.damage_of_property_score.should eql(5)
  #     transformer_information.social_aspect.score.should eql(1)
  #     transformer_information.public_image.score.should eql(1)
  #     transformer_information.pollution.score.should eql(4)
  #     transformer_information.transformer.brand.score.should eql(5) 
  #     transformer_information.denominator.should eql(191)
  #     transformer_information.importance_index.should be_close(57.59, 0.01)
  #   end    
  # end
  # 
  # context "CC-KT1A" do 
  #   it "should return correct results" do
  #     transformer = Transformer.find_by_transformer_name('CC-KT1A')
  #     transformer_information = TransformerInformation.find_by_transformer_id(transformer.id)
  #     transformer_information.load_pattern_per_year.load_pattern_factor.score.should eql(2)
  #     transformer_information.system_location.score.should eql(3)
  #     transformer_information.n1_criteria.score.should eql(1)
  #     transformer_information.system_stability.score.should eql(1)
  #     transformer_information.application_use.score.should eql(4)
  #     transformer_information.probability_of_force_outage(:score).should eql(1)
  #     transformer_information.damage_of_property_score.should eql(3)
  #     transformer_information.social_aspect.score.should eql(5)
  #     transformer_information.public_image.score.should eql(5)
  #     transformer_information.pollution.score.should eql(4)
  #     transformer_information.transformer.brand.score.should eql(5) 
  #     transformer_information.importance_index.should be_close(57.59, 0.01)
  #   end    
  # end
  # 
end

# == Schema Information
#
# Table name: transformer_informations
#
#  id                                :integer(4)      not null, primary key
#  bus_voltage_hv_id                 :integer(4)
#  bus_voltage_lv_id                 :integer(4)
#  created_at                        :datetime
#  updated_at                        :datetime
#  system_fault_level_hv             :float
#  system_fault_level_lv             :float
#  probability_of_force_outage_id    :integer(4)
#  social_aspect_id                  :integer(4)
#  system_location_id                :integer(4)
#  application_use_id                :integer(4)
#  system_stability_id               :integer(4)
#  pollution_id                      :integer(4)
#  n1_criteria_id                    :integer(4)
#  public_image_id                   :integer(4)
#  system_fault_level_id             :integer(4)
#  transformer_id                    :integer(4)
#  recorded_date                     :date
#  bus_voltage_id                    :integer(4)
#  overall_condition                 :float
#  probability_of_force_outage_value :integer(4)
#  recent                            :boolean(1)
#

