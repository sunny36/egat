# == Schema Information
# Schema version: 20110203165120
#
# Table name: conservator_tanks
#
#  id                   :integer(4)      not null, primary key
#  breather_maintank    :integer(10)
#  breather_oltc        :integer(10)
#  corrosion_maintank   :integer(10)
#  corrosion_oltc       :integer(10)
#  jel_color_maintank   :integer(10)
#  jel_color_oltc       :integer(10)
#  oil_level_maintank   :integer(10)
#  oil_level_oltc       :integer(10)
#  oilfail_maintank     :integer(10)
#  oilfail_oltc         :integer(10)
#  visual_inspection_id :integer(4)
#

class ConservatorTank < ActiveRecord::Base
  belongs_to :visual_inspection

  #----------------------------- Validations ----------------------------------
  validates_presence_of :breather_maintank, :message => "can't be blank"
  validates_presence_of :corrosion_maintank, :message => "can't be blank"
  validates_presence_of :jel_color_maintank, :message => "can't be blank"
  validates_presence_of :oil_level_maintank, :message => "can't be blank"
  validates_presence_of :oilfail_maintank, :message => "can't be blank"

  validates_presence_of :breather_oltc, :message => "can't be blank"
  validates_presence_of :corrosion_oltc, :message => "can't be blank"
  validates_presence_of :jel_color_oltc, :message => "can't be blank"
  validates_presence_of :oil_level_oltc, :message => "can't be blank"
  validates_presence_of :oilfail_oltc, :message => "can't be blank"
  #----------------------------------------------------------------------------

  def hi_factor
    ConservatorTankFactor.all.each do |i|
    i.end = 100 if i.end.nil?
    return i.hi_factor if percent_conservator_tank_factor.round.between?(i.start, i.end)
    end
  end

  def percent_conservator_tank_factor
    (numerator/denominator).to_f * 100.0
  end

  private
    def numerator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.find(self.send(f)).score.to_i *
                VisualInspectionCondition.weight(f, :conservator_tanks)).to_f
      end
      return sum
    end

    def denominator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.max_score(f, :conservator_tanks) *
                VisualInspectionCondition.weight(f, :conservator_tanks)).to_f
      end
      return sum
    end

    def fields
      oltc_fields = ['corrosion_oltc', 'oilfail_oltc', 'oil_level_oltc',
                     'jel_color_oltc', 'breather_oltc']
      maintank_fields = ['corrosion_maintank', 'oilfail_maintank',
                         'oil_level_maintank', 'jel_color_maintank',
                         'breather_maintank']
      return oltc_fields + maintank_fields
    end

end
