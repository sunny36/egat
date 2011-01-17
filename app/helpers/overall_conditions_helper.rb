module OverallConditionsHelper

  def general_condition_hi_factor(general_condition)
    unless general_condition.nil?
      general_condition.hi_factor
    end
  end

  def general_condition_factor_color(general_condition, visual_inspection, transformer)
    unless general_condition.nil?
      general_condition_factor = GeneralConditionFactor.
        where("hi_factor = ?", general_condition.hi_factor).first
      return link_to("<span style=\"padding:0px 40px 0px 40px; background:rgb(#{general_condition_factor.color});\"></span>".html_safe, 
                     transformer_visual_inspection_general_conditions_path(transformer, visual_inspection))
                    
    end
  end
  
  def general_condition_recent_date(visual_inspection)
    unless visual_inspection.nil?
      visual_inspection.test_date.strftime("%d/%m/%Y")
    end
  end


end
