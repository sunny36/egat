module PowerFactorsHelper
  def javascript_includes
    javascript_include_tag('jquery-ui-1.8.4.custom.min','ext-jquery-adapter',
                           'ext-all', 'jquery.url',
                           'jquery.flot.min.js', 'jquery.flot.selection.min.js',
                           'jquery.flot.axislabels.js',
                           'controllers/power_factors')
  end

  def hi_factor_color
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{PowerFactor.color(@transformer.id)});\"></span>".html_safe
  end

end
