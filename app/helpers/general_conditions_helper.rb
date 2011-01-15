module GeneralConditionsHelper
  def max_load_label
    visual_inspection_condition =
      VisualInspectionCondition.where("name = 'maxload'")
    label :general_condition, :maxload,
      visual_inspection_condition.first.description
  end

  def max_load_select_list(form)
    maxload_list = VisualInspectionCondition.where("name = 'maxload'").order("score")
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

  def sound_label
    sound_label_string = 
      VisualInspectionCondition.where("name = 'sound'").first.description
    label :general_condition, :sound, sound_label_string
  end

  def sound_select_list(form)
    sound_list = VisualInspectionCondition.where("name = 'sound'").order("score")
    form.collection_select(:sound, sound_list, :id, :condition,
                           {:include_blank => true})
   
  end

  def vibration_label
    vibration_label_string = 
      VisualInspectionCondition.where("name = 'vibration'").first.description
    label :general_condition, :vibration, vibration_label_string
  end

  def vibration_select_list(form)
   vibration_list = 
     VisualInspectionCondition.where("name = 'vibration'").order("score") 
   form.collection_select(:vibration, vibration_list, :id, :condition,
                          {:include_blank => true})
  end

  def ground_connector_label
    ground_connector_label_string = 
      VisualInspectionCondition.
      where("name = 'ground_connector'").first.description
    label :general_condition, :ground_connector, ground_connector_label_string
  end

  def ground_connector_select_list(form)
   ground_connector_list = 
     VisualInspectionCondition.where("name = 'ground_connector'").order("score") 
   form.collection_select(:ground_connector, ground_connector_list, :id, 
                          :condition, {:include_blank => true})
  end

  def foundation_label
    foundation_label_string = 
      VisualInspectionCondition.where("name = 'foundation'").first.description
    label :general_condition, :foundation, foundation_label_string
  end

  def foundation_select_list(form)
   foundation_list = 
     VisualInspectionCondition.where("name = 'foundation'").order("score") 
   form.collection_select(:foundation, foundation_list, :id, :condition,
                          {:include_blank => true})
  end

  def animal_protect_label
    animal_protect_label_string = 
      VisualInspectionCondition.
      where("name = 'animal_protect'").first.description
    label :general_condition, :animal_protect, animal_protect_label_string
  end

  def animal_protect_select_list(form)
   animal_protect_list = 
     VisualInspectionCondition.where("name = 'animal_protect'").order("score") 
   form.collection_select(:animal_protect, animal_protect_list, :id, 
                          :condition, {:include_blank => true})
  end
end
