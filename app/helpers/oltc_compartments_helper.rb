module OltcCompartmentsHelper
  def percent_oltc_compartment_factor(oltc_compartment)
    number_with_precision(oltc_compartment.percent_oltc_compartment_factor, 
                          :precision => 2)
  end

  def description(field_name, remove_leading_number = true)
    description = VisualInspectionCondition.
      where("name = ? AND table_name = 'oltc_compartments'", 
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
    oltc_compartment_factor = 
      OltcCompartmentFactor.where("hi_factor = ?", hi_factor).first
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{oltc_compartment_factor.color});\"></span>".html_safe
  end

end
