module LoadHistoriesHelper
  def javascript_includes
    javascript_include_tag('jquery-ui-1.8.4.custom.min',
                           'ext-jquery-adapter', 'ext-all',
                           'jquery.url',
                           'controllers/visual_inspection')
  end
  
  def hi_factor_color(hi_factor)   
    load_history_factor = LoadHistoryFactor.where("hi_factor = ?", hi_factor).first
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{load_history_factor.color});\"></span>".html_safe
  end
  
  def description(field_name, remove_leading_number = true)
    description = VisualInspectionCondition.
      where("name = ? AND table_name = 'general_conditions'", field_name.to_s).
      first.description
    if remove_leading_number
      description.split(" ", 2).second
    else 
      description
    end
  end
  
  def maxload_condition(general_condition)
    maxload_condition = 
      VisualInspectionCondition.find(general_condition.maxload)
    if maxload_condition.start == 0
      condition = "<=#{maxload_condition.end}%"
    elsif maxload_condition.end.nil?
      condition = ">#{maxload_condition.start - 1}%"
    else
      condition = "#{maxload_condition.start}-#{maxload_condition.end}%"
    end
  end
  
end
