module RegulatingPtsHelper
  def percent_regulating_pt_factor(regulating_pt)
    number_with_precision(regulating_pt.percent_regulating_pt_factor, 
                          :precision => 2)
  end

  def description(field_name, remove_leading_number = true)
    description = VisualInspectionCondition.
      where("name = ? AND table_name = 'regulating_pts'", 
            field_name.to_s).first.description
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
    regulating_pt_factor = 
      RegulatingPtFactor.where("hi_factor = ?", hi_factor).first
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{regulating_pt_factor.color});\"></span>".html_safe
  end


end
