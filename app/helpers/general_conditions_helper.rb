module GeneralConditionsHelper
  def javascript_includes
    javascript_include_tag('jquery-ui-1.8.4.custom.min',
                           'ext-jquery-adapter', 'ext-all',
                           'jquery.url',
                           'controllers/visual_inspection')
  end

  def max_load_label(form)
    label_for :maxload, form
  end

  def max_load_select_list(form)
    maxload_list =
      VisualInspectionCondition.
      where("table_name = 'general_conditions' AND name = 'maxload'").
      order("score")
    maxload_list.each do |maxload|
      if maxload.start == 0
        maxload.condition = "<#{maxload.end + 1}%"
      elsif maxload.end.nil?
        maxload.condition = ">#{maxload.start - 1}%"
      else
        maxload.condition = "#{maxload.start} - #{maxload.end}%"
      end
    end
    form.collection_select(:maxload, maxload_list, :id, :condition,
                           {:include_blank => true})
  end

  def sound_label(form)
    label_for :sound, form
  end

  def sound_select_list(form)
    select_list_for :sound, form
  end

  def vibration_label(form)
    label_for :vibration, form
  end

  def vibration_select_list(form)
    select_list_for :vibration, form
  end

  def ground_connector_label(form)
    label_for :ground_connector, form
  end

  def ground_connector_select_list(form)
    select_list_for :ground_connector, form
  end

  def foundation_label(form)
    label_for :foundation, form
  end

  def foundation_select_list(form)
    select_list_for :foundation, form
  end

  def animal_protect_label(form)
    label_for :animal_protect, form
  end

  def animal_protect_select_list(form)
    select_list_for :animal_protect, form
  end

  def label_for(field_name, form, required = true)
    label_string = VisualInspectionCondition.
      where("table_name = 'general_conditions' AND name = ?", field_name.to_s).
      first.description
    label_string = label_string + " *" if required
    form.label field_name, label_string
  end

  def select_list_for(field_name, form)
    list = VisualInspectionCondition.
      where("table_name = 'general_conditions' AND name = ?", field_name.to_s).
      order("score")
    form.collection_select(field_name, list, :id, :condition,
                           {:include_blank => true})
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
