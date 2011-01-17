# == Schema Information
# Schema version: 20110115144540
#
# Table name: general_conditions
#
#  id                   :integer(4)      not null, primary key
#  test_by              :string(255)
#  test_date            :datetime
#  work_order           :string(255)
#  animal_protect       :integer(10)
#  foundation           :integer(10)
#  ground_connector     :integer(10)
#  maxload              :integer(10)
#  perform_type         :integer(10)
#  sound                :integer(10)
#  transformer_id       :integer(10)
#  vibration            :integer(10)
#  visual_inspection_id :integer(4)
#

class GeneralCondition < ActiveRecord::Base
  belongs_to :transformer
  belongs_to :visual_inspection

  #Validations
  validates_presence_of :maxload, :message => "can't be blank"
  validates_presence_of :sound, :message => "can't be blank"
  validates_presence_of :vibration, :message => "can't be blank"
  validates_presence_of :ground_connector, :message => "can't be blank"
  validates_presence_of :foundation, :message => "can't be blank"
  validates_presence_of :animal_protect, :message => "can't be blank"

  def hi_factor
    GeneralConditionFactor.all.each do |i|
      i.end = 100 if i.end.nil?
      return i.hi_factor if percent_general_condition_factor.round.between?(i.start, i.end)
    end
  end
  
  def percent_general_condition_factor
    (numerator/denominator) * 100.0
  end
  
  def numerator
    (max_load_times_weight + 
     sound_times_weight + 
     vibration_times_weight + 
     ground_connector_times_weight + 
     foundation_times_weight + 
     animal_protect_times_weight).to_f
  end
  
  def denominator 
    fields = [:maxload, :sound, :vibration, :ground_connector, :foundation, :animal_protect]
    sum = 0
    fields.each do |f|
      sum += (VisualInspectionCondition.max_score(f, :general_conditions) * 
              VisualInspectionCondition.weight(f, :general_conditions)).to_f      
    end
    return sum
  end

  def max_load_times_weight
    VisualInspectionCondition.find(self.maxload).score.to_i *
    VisualInspectionCondition.weight(:maxload, :general_conditions)
  end

  def sound_times_weight
    VisualInspectionCondition.find(self.sound).score.to_i *
    VisualInspectionCondition.weight(:sound, :general_conditions)
  end
  
  
  def vibration_times_weight
    VisualInspectionCondition.find(self.vibration).score.to_i *
    VisualInspectionCondition.weight(:vibration, :general_conditions)
  end
  
  def ground_connector_times_weight
    VisualInspectionCondition.find(self.ground_connector).score.to_i *
    VisualInspectionCondition.weight(:ground_connector, :general_conditions)
  end

  def foundation_times_weight
    VisualInspectionCondition.find(self.foundation).score.to_i *
    VisualInspectionCondition.weight(:foundation, :general_conditions)
  end

  def animal_protect_times_weight
    VisualInspectionCondition.find(self.animal_protect).score.to_i *
    VisualInspectionCondition.weight(:animal_protect, :general_conditions)
  end
  
  
  
end