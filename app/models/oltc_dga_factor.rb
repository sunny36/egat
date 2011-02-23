# == Schema Information
# Schema version: 20110223125749
#
# Table name: oltc_dga_factors
#
#  id         :integer(4)      not null, primary key
#  hi_factor  :integer(4)
#  condition  :string(255)
#  status     :string(255)
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class OltcDgaFactor < ActiveRecord::Base

  def self.hi_factor(transformer_id)
    oltc_dgas = OltcDga.where("transformer_id = ?",
                              transformer_id).order("test_date DESC")
    return nil if oltc_dgas.blank?
    self.all.each do |i|
      if oltc_dgas.first.status == i.status
        return i.hi_factor
      end
    end
  end

  def self.color(transformer_id)
    hi_factor = self.hi_factor(transformer_id)
    power_factor = OltcDgaFactor.where("hi_factor = ?", hi_factor)
    power_factor.first.color
  end

  def self.test_date(transformer_id)
    oltc_dgas = OltcDga.where("transformer_id = ?",
                              transformer_id).order("test_date DESC")
    unless oltc_dgas.blank?
      return oltc_dgas.first.test_date.strftime("%d/%m/%Y")
    else
      return nil
    end
  end


end
