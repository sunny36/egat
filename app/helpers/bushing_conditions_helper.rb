module BushingConditionsHelper 
  def javascript_includes
    javascript_include_tag('jquery-ui-1.8.4.custom.min',
                           'ext-jquery-adapter', 'ext-all',
                           'jquery.url',
                           'controllers/visual_inspection')
  end
  
  def description(field_name, remove_leading_number = true)
    description = VisualInspectionCondition.
      where("name = ? AND table_name = 'bushing_conditions'", field_name.to_s).
      first.description
    if remove_leading_number
      description.split(" ", 2).second
    else 
      description
    end
  end
  
  def condition(id)
    VisualInspectionCondition.find(id).condition
  end
  
  def hi_factor_color(hi_factor)   
    bushing_condition_factor = GeneralConditionFactor.where("hi_factor = ?", hi_factor).first
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{bushing_condition_factor.color});\"></span>".html_safe
  end
  

end
