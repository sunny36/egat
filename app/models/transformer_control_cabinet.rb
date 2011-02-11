# == Schema Information
# Schema version: 20110206175519
#
# Table name: transformer_control_cabinets
#
#  id                   :integer(4)      not null, primary key
#  animal               :integer(10)
#  control_humidity     :integer(10)
#  corrosion            :integer(10)
#  pragen               :integer(10)
#  wiring_control       :integer(10)
#  visual_inspection_id :integer(4)
#

class TransformerControlCabinet < ActiveRecord::Base
  belongs_to :visual_inspection

  #----------------------------- Validations ----------------------------------
  validates_presence_of :animal, :message => "can't be blank"
  validates_presence_of :control_humidity, :message => "can't be blank"
  validates_presence_of :pragen, :message => "can't be blank"
  validates_presence_of :wiring_control, :message => "can't be blank"
  #----------------------------------------------------------------------------

  def hi_factor
    TransformerControlCabinetFactor.all.each do |i|
      i.end = 100 if i.end.nil?
      if percent_transformer_control_cabinet_factor.round.between?(i.start, i.end)
        return i.hi_factor
      end
    end
  end

  def percent_transformer_control_cabinet_factor
    (numerator/denominator).to_f * 100.0
  end

  private
    def numerator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.find(self.send(f)).score.to_i *
                VisualInspectionCondition.weight(f, :transformer_control_cabinets)).to_f
      end
      return sum
    end

    def denominator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.max_score(f, :transformer_control_cabinets) *
                VisualInspectionCondition.weight(f, :transformer_control_cabinets)).to_f
      end
      return sum
    end

    def fields
      ['animal', 'control_humidity', 'corrosion', 'pragen', 'wiring_control']
    end
end
