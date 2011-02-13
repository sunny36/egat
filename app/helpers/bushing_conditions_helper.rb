module BushingConditionsHelper 
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
    bushing_condition_factor = BushingConditionFactor.where("hi_factor = ?", hi_factor).first
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{bushing_condition_factor.color});\"></span>".html_safe
  end
  

end
