class FuranFactor < ActiveRecord::Base

  def self.hi_factor(transformer_id)
    furans = Furan.where("transformer_id = ?",
                         transformer_id).order("test_date DESC")
    return nil if furans.blank?
    self.all.each do |i|
      i.end = 10000000 if i.end.nil?
      furan_factor = furans.first.fal
      if furan_factor.round(1).between?(i.start, i.end)
        return i.hi_factor
      end
    end
  end

  def self.color(transformer_id)
    hi_factor = self.hi_factor(transformer_id)
    furan_factor = self.where("hi_factor = ?", hi_factor)
    furan_factor.first.color
  end

  def self.test_date(transformer_id)
    furans = Furan.where("transformer_id = ?",
                         transformer_id).order("test_date DESC")
    unless furans.blank?
      return furans.first.test_date.strftime("%d/%m/%Y")
    else
      return nil
    end
  end

end
