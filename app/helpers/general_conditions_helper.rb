module GeneralConditionsHelper
  def javascript_includes
    javascript_include_tag('jquery-ui-1.8.4.custom.min',
                           'ext-jquery-adapter', 'ext-all',
                           'jquery.url',
                           'controllers/visual_inspection')
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
  
  def sound_condition(general_condition)
    condition(general_condition.sound)
  end

  def vibration_condition(general_condition)
    condition(general_condition.vibration)
  end

  def ground_connector_condition(general_condition)
    condition(general_condition.ground_connector)
  end

  def foundation_condition(general_condition)
    condition(general_condition.foundation)
  end

  def animal_protect_condition(general_condition)
    condition(general_condition.animal_protect)
  end
  
  def condition(id)
    VisualInspectionCondition.find(id).condition
  end
  
  def hi_factor_color(hi_factor)   
    general_condition_factor = GeneralConditionFactor.where("hi_factor = ?", hi_factor).first
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{general_condition_factor.color});\"></span>".html_safe
  end
  

end
