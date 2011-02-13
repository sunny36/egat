module MainTanksHelper
  def percent_main_tank_factor(main_tank)
    number_with_precision(main_tank.percent_main_tank_factor, :precision => 2)
  end

  def description(field_name, remove_leading_number = true)
    description = VisualInspectionCondition.
      where("name = ? AND table_name = 'main_tanks'", field_name.to_s).
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
    conservator_tank_factor = 
      ConservatorTankFactor.where("hi_factor = ?", hi_factor).first
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{conservator_tank_factor.color});\"></span>".html_safe
  end

end
