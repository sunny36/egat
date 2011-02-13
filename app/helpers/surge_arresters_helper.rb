module SurgeArrestersHelper
  def percent_surge_arrester_factor(surge_arrester, side)
    if side == :tv 
      unless surge_arrester.tv_side.nil?
        return number_with_precision(
          surge_arrester.percent_surge_arrester_factor(side), :precision => 2)
      else
        return " - "
      end
    end
    number_with_precision(surge_arrester.percent_surge_arrester_factor(side), 
                          :precision => 2)
  end

  def description(field_name, remove_leading_number = true)
    description = VisualInspectionCondition.
      where("name = ? AND table_name = 'surge_arresters'", field_name.to_s).
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
    bushing_condition_factor = GeneralConditionFactor.where("hi_factor = ?", hi_factor).first
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{bushing_condition_factor.color});\"></span>".html_safe
  end

end
