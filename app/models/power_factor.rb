# == Schema Information
# Schema version: 20110223043904
#
# Table name: power_factors
#
#  id         :integer(4)      not null, primary key
#  hi_factor  :integer(4)
#  condition  :string(255)
#  start      :float
#  end        :float
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class PowerFactor < ActiveRecord::Base 

  def self.hi_factor(transformer_id)
    insulating_oils = InsulatingOil.where("transformer_id = ?", transformer_id).order("test_date DESC")
    return nil if insulating_oils.blank?
    self.all.each do |i|
      i.end = 10000000 if i.end.nil?
      power_factor = insulating_oils.first.cor_percent_power_factor_maintank
      if power_factor.round(1).between?(i.start, i.end)
        return i.hi_factor
      end
    end
  end

  def self.color(transformer_id)
    hi_factor = self.hi_factor(transformer_id)
    power_factor = PowerFactor.where("hi_factor = ?", hi_factor)
    power_factor.first.color
  end

  def self.test_date(transformer_id)
    insulating_oils = InsulatingOil.where("transformer_id = ?", 
                                          transformer_id).order("test_date DESC")
    unless insulating_oils.blank?
      return insulating_oils.first.test_date.strftime("%d/%m/%Y")
    else
      return nil
    end
  end
end
