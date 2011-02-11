# == Schema Information
# Schema version: 20110206175519
#
# Table name: radiator_cooling_systems
#
#  id                   :integer(4)      not null, primary key
#  animal               :integer(10)
#  corrosion            :integer(10)
#  noise_level          :integer(10)
#  oil_fail             :integer(10)
#  oil_pump             :integer(10)
#  visual_inspection_id :integer(4)
#

class RadiatorCoolingSystem < ActiveRecord::Base
  belongs_to :visual_inspection

  #----------------------------- Validations ----------------------------------
  validates_presence_of :animal, :message => "can't be blank"
  validates_presence_of :corrosion, :message => "can't be blank"
  validates_presence_of :noise_level, :message => "can't be blank"
  validates_presence_of :oil_fail, :message => "can't be blank"
  #----------------------------------------------------------------------------

  def hi_factor
    RadiatorCoolingSystemFactor.all.each do |i|
      i.end = 100 if i.end.nil?
      if percent_radiator_cooling_system_factor.round.between?(i.start, i.end)
        return i.hi_factor
      end
    end
  end

  def percent_radiator_cooling_system_factor
    (numerator/denominator).to_f * 100.0
  end

  private
    def numerator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.find(self.send(f)).score.to_i *
                VisualInspectionCondition.weight(f, :radiator_cooling_systems)).to_f
      end
      return sum
    end

    def denominator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.max_score(f, :radiator_cooling_systems) *
                VisualInspectionCondition.weight(f, :radiator_cooling_systems)).to_f
      end
      return sum
    end

    def fields
      ['animal', 'corrosion', 'noise_level', 'oil_fail', 'oil_pump']
    end
end
