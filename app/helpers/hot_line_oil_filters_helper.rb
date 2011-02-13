module HotLineOilFiltersHelper

  def percent_hot_line_oil_filter_factor(hot_line_oil_filter)
    number_with_precision(hot_line_oil_filter.percent_hot_line_oil_filter_factor, 
                          :precision => 2)
  end

  def description(field_name, remove_leading_number = true)
    description = VisualInspectionCondition.
      where("name = ? AND table_name = 'hot_line_oil_filters'", field_name.to_s).
      first.description
    if remove_leading_number
      description.split(" ", 2).second
    else 
      description
    end
  end

  def condition(id)
    return " - " if id.nil?
    VisualInspectionCondition.find(id).condition
  end

  def hi_factor_color(hi_factor)   
    hot_line_oil_filter_factor = 
      HotLineOilFilterFactor.where("hi_factor = ?", hi_factor).first
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{hot_line_oil_filter_factor.color});\"></span>".html_safe
  end

end
