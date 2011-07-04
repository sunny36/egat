class InsulatingOilFactor < ActiveRecord::Base
  
  belongs_to :color

  def self.percent_hi(insulating_oil, oil_contamination)
    contamination_hi_factor = OilQuality.new.hi_factor(insulating_oil, oil_contamination, :contamination)
    aging_product_hi_factor = AgingProduct.new.hi_factor(oil_contamination)
    oil_contamination_weight = InsulatingOilWeight.find_by_name("oil_contamination").weight
    aging_product_weight = InsulatingOilWeight.find_by_name("aging_product").weight
    numerator = (contamination_hi_factor * oil_contamination_weight) + (aging_product_hi_factor * aging_product_weight)
    denominator = (4 * oil_contamination_weight) + (4 * aging_product_weight)
    numerator/denominator
  end

  def self.color(insulating_oil, oil_contamination)
    self.all.each do |insulating_oil_factor|
      condition = self.percent_hi(insulating_oil, oil_contamination).round.between?(insulating_oil_factor.start,
                                                                                    insulating_oil_factor.end)
      return insulating_oil_factor.color.value if condition                                                                                    
    end
  end
end

# == Schema Information
#
# Table name: insulating_oil_factors
#
#  id         :integer(4)      not null, primary key
#  hi_factor  :integer(4)
#  condition  :string(255)
#  start      :integer(4)
#  end        :integer(4)
#  color_id   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

