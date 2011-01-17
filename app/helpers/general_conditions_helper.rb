module GeneralConditionsHelper
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
    
end