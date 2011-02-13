module ThermoScansHelper
  def javascript_includes
    javascript_include_tag('jquery-ui-1.8.4.custom.min',
                           'ext-jquery-adapter', 'ext-all',
                           'jquery.url',
                           'controllers/visual_inspection')
  end
    
  def hi_factor_color(hi_factor)   
    thermo_scan_factor = ThermoScanFactor.where("hi_factor = ?", hi_factor).first
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{thermo_scan_factor.color});\"></span>".html_safe
  end
  
end
