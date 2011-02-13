module RadiatorCoolingSystemsHelper

  def percent_radiator_cooling_system_factor(radiator_cooling_system)
    number_with_precision(
      radiator_cooling_system.percent_radiator_cooling_system_factor, 
      :precision => 2)
  end

  def description(field_name, remove_leading_number = true)
    description = VisualInspectionCondition.
      where("name = ? AND table_name = 'radiator_cooling_systems'", 
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
    radiator_cooling_system_factor = 
      HotLineOilFilterFactor.where("hi_factor = ?", hi_factor).first
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{radiator_cooling_system_factor.color});\"></span>".html_safe
  end


end
