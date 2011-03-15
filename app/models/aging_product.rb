class AgingProduct < ActiveRecord::Base
  belongs_to :color
  
  def self.find_all_by_name_and_transformer(name, transformer)
    u = transformer.hv
    aging_products = AgingProduct.where(:name => name)
    ids = Array.new
    aging_products.each do |aging_product|
      aging_product.u_start = 0 if aging_product.u_start.nil?
      aging_product.u_end = 1000000 if aging_product.u_end.nil?
      if u.between?(aging_product.u_start, aging_product.u_end)
        ids << aging_product.id
      end
    end
    aging_products.where(:id => ids) 
  end
  
  def hi_factor(oil_contamination)
    return nil if oil_contamination.blank?
    AgingProductFactor.all.each do |aging_product_factor|
      aging_product_factor.start = 0 if aging_product_factor.start.nil?
      aging_product_factor.end = 100 if aging_product_factor.end.nil?
      if percent_aging_product_factor(oil_contamination).round.between?(aging_product_factor.start,
                                                                        aging_product_factor.end)
        return aging_product_factor.hi_factor
      end
    end
  end
  
  def hi_factor_color(oil_contamination)
    return nil if oil_contamination.blank?
    AgingProductFactor.where('hi_factor = ?', hi_factor(oil_contamination)).first.color.value
  end

  def test_date(oil_contamination)
    return nil if oil_contamination.blank?
    return "#{oil_contamination.thai_test_date}"
  end
  

  def percent_aging_product_factor(oil_contamination)
    return nil if oil_contamination.blank?
    return (numerator(oil_contamination).to_f / denominator.to_f) * 100.0
  end

  def numerator(oil_contamination)
    u = oil_contamination.transformer.hv
    ift_by_nn = oil_contamination.ift.to_f/oil_contamination.nn.to_f
    score = weight = nil
    AgingProduct.where(:name => "ift/nn").each do |aging_product|
      aging_product.u_end = 1000000 if aging_product.u_end.nil?
      if (u.between?(aging_product.u_start, aging_product.u_end) &&
          ift_by_nn.round.between?(aging_product.start, aging_product.end))
        score = aging_product.score
        weight = aging_product.weight
      end
    end
    score * weight
  end

  def denominator
    aging_product = AgingProduct.where(:name => "ift/nn").order("score DESC").first
    max_score = aging_product.score.to_i
    weight = aging_product.weight.to_i
    max_score * weight
  end
end
