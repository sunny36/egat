module OilQualitiesHelper
  def hi_factor_color
    oil_quality = OilQuality.new
    color = oil_quality.hi_factor_color(@insulating_oil, @oil_contamination)
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{color});\"></span>".html_safe
  end

  def percent_oil_quality_factor
    oil_quality = OilQuality.new
    number_with_precision(oil_quality.percent_oil_quality_factor(@insulating_oil, @oil_contamination), :precision => 2)
  end  
end
