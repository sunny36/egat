module TransformerControlCabinetsHelper
  def percent_transformer_control_cabinet_factor(transformer_control_cabinet)
    number_with_precision(
      transformer_control_cabinet.percent_transformer_control_cabinet_factor, 
      :precision => 2)
  end

  def description(field_name, remove_leading_number = true)
    description = VisualInspectionCondition.
      where("name = ? AND table_name = 'transformer_control_cabinets'", 
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
    transformer_control_cabinet_factor = 
      TransformerControlCabinetFactor.where("hi_factor = ?", hi_factor).first
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{transformer_control_cabinet_factor.color});\"></span>".html_safe
  end


end
