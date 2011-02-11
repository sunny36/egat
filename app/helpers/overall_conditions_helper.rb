module OverallConditionsHelper

  def hi_factor(object)
    unless object.nil?
      object.hi_factor
    end
  end

  def general_condition_factor_color(general_condition, visual_inspection, transformer)
    unless general_condition.nil?
      general_condition_factor =
        GeneralConditionFactor.where("hi_factor = ?",
                                     general_condition.hi_factor).first
      color = "<span style=\"padding:0px 40px 0px 40px; background:rgb(" +
        "#{general_condition_factor.color});\">" + "</span>"
      link =
        transformer_visual_inspection_general_conditions_path(transformer,
                                                              visual_inspection)
        return link_to(color.html_safe, link)
    end
  end

  def load_history_factor_color(general_condition, visual_inspection, transformer)
    unless general_condition.nil?
      load_history_factor =
        LoadHistoryFactor.where("hi_factor = ?",
                                general_condition.load_history_hi_factor).first
      color = "<span style=\"padding:0px 40px 0px 40px; background:rgb(" +
        "#{load_history_factor.color});\">" + "</span>"
      link =
        transformer_visual_inspection_load_histories_path(transformer,
                                                          visual_inspection)
        return link_to(color.html_safe, link)
    end
  end

  def bushing_condition_factor_color(bushing_condition, visual_inspection, transformer)
    unless bushing_condition.nil?
      bushing_condition_factor =
        BushingConditionFactor.where("hi_factor = ?",
                                     bushing_condition.hi_factor).first
      color = "<span style=\"padding:0px 40px 0px 40px; background:rgb(" +
        "#{bushing_condition_factor.color});\">" + "</span>"
      link =
        transformer_visual_inspection_bushing_conditions_path(transformer,
                                                              visual_inspection)
        return link_to(color.html_safe, link)
    end
  end

  def surge_arrester_factor_color(surge_arrester, visual_inspection, transformer)
    unless surge_arrester.nil?
      surge_arrester_factor =
        SurgeArresterFactor.where("hi_factor = ?",
                                  surge_arrester.hi_factor).first
      color = "<span style=\"padding:0px 40px 0px 40px; background:rgb(" +
        "#{surge_arrester_factor.color});\">" + "</span>"
      link =
        transformer_visual_inspection_surge_arresters_path(transformer,
                                                           visual_inspection)
        return link_to(color.html_safe, link)
    end
  end

  def conservator_tank_factor_color(visual_inspection, transformer)
    unless visual_inspection.conservator_tank.nil?
      conservator_tank_factor =
        ConservatorTankFactor.where("hi_factor = ?",
                                    visual_inspection.conservator_tank.hi_factor).first
      color = "<span style=\"padding:0px 40px 0px 40px; background:rgb(" +
        "#{conservator_tank_factor.color});\">" + "</span>"
      link =
        transformer_visual_inspection_conservator_tanks_path(transformer,
                                                             visual_inspection)
        return link_to(color.html_safe, link)
    end
  end

  def main_tank_factor_color(visual_inspection, transformer)
    unless visual_inspection.main_tank.nil?
      main_tank_factor =
        MainTankFactor.where("hi_factor = ?",
                             visual_inspection.main_tank.hi_factor).first
      color = "<span style=\"padding:0px 40px 0px 40px; background:rgb(" +
        "#{main_tank_factor.color});\">" + "</span>"
      link = transformer_visual_inspection_main_tanks_path(transformer,
                                                           visual_inspection)
      return link_to(color.html_safe, link)
    end
  end



  def recent_date(visual_inspection)
    unless visual_inspection.nil?
      visual_inspection.test_date.strftime("%d/%m/%Y")
    end
  end

end
