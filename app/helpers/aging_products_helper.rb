module AgingProductsHelper
  def hi_factor_color
    aging_product = AgingProduct.new
    color = aging_product.hi_factor_color(@oil_contamination)
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{color});\"></span>".html_safe
  end

  def percent_aging_product_factor
    aging_product = AgingProduct.new
    number_with_precision(aging_product.percent_aging_product_factor(@oil_contamination), :precision => 2)
  end
end
