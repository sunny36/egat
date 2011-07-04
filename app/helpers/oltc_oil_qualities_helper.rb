module OltcOilQualitiesHelper

  def hi_factor_color(type)
    oltc_oil_quality = OltcOilQuality.new
    color = oltc_oil_quality.hi_factor_color(@insulating_oil, @oltc_oil_contamination, type)
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{color});\"></span>".html_safe
  end

  def percent_oltc_oil_quality_factor
    oltc_oil_quality = OltcOilQuality.new
    number_with_precision(oltc_oil_quality.percent_oltc_oil_quality_factor(@insulating_oil, @oltc_oil_contamination),
                           :precision => 2)
  end
  
  def percent_oltc_oil_contamination_factor
    number_with_precision(
      OltcOilQuality.new.percent_oltc_oil_contamination_factor(@insulating_oil, @oltc_oil_contamination), precision: 2)
  end
  
  def percent_oltc_dielectric_property_factor
    number_with_precision(OltcOilQuality.new.percent_oltc_dielectric_property_factor(@insulating_oil), precision: 2)
  end
  
end
