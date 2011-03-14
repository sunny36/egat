class AgingProduct < ActiveRecord::Base

  def hi_factor(oil_contamination)

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
