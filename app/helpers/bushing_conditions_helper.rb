module BushingConditionsHelper 
  def porcelain_status_hv_label
    porcelain_status_label :hv
  end

  def porcelain_status_lv_label
    porcelain_status_label :lv
  end

  def porcelain_status_tv_label
    porcelain_status_label :tv
  end

  def porcelain_status_label(side)
    label :bushing_condition, 'porcelain_status_' + side.to_s,
      VisualInspectionCondition.
      where("name = '#{'porcelain_status_' + side.to_s}' AND table_name = 'bushing_conditions'").
      first.description
  end

  def porcelain_status_hv_select_list(form)
    porcelain_status_select_list form, :hv 
  end

  def porcelain_status_lv_select_list(form)
    porcelain_status_select_list form, :lv 
  end

  def porcelain_status_tv_select_list(form)
    porcelain_status_select_list form, :tv 
  end

  def porcelain_status_select_list(form, side)
    porcelain_status_list = 
      VisualInspectionCondition.
      where("name = '#{'porcelain_status_' + side.to_s}' AND table_name = 'bushing_conditions'").
      order("score")
    form.collection_select('porcelain_status_' + side.to_s, porcelain_status_list, :id,
                           :condition, {:include_blank => true})
  end

  def porcelain_clean_hv_label
   porcelain_clean_label :hv 
  end

  def porcelain_clean_lv_label
   porcelain_clean_label :lv 
  end

  def porcelain_clean_tv_label
   porcelain_clean_label :tv 
  end

  def porcelain_clean_label(side)
    label :bushing_condition, 'porcelain_clean_' + side.to_s,
      VisualInspectionCondition.
      where("name = '#{'porcelain_clean_' + side.to_s}' AND table_name = 'bushing_conditions'").
      first.description
  end

  def porcelain_clean_hv_select_list(form)
    porcelain_clean_select_list form, :hv 
  end

  def porcelain_clean_lv_select_list(form)
    porcelain_clean_select_list form, :lv 
  end

  def porcelain_clean_tv_select_list(form)
    porcelain_clean_select_list form, :tv 
  end

  def porcelain_clean_select_list(form, side)
    porcelain_clean_list = 
      VisualInspectionCondition.
      where("name = '#{'porcelain_clean_' + side.to_s}' AND table_name = 'bushing_conditions'").
      order("score")
    form.collection_select('porcelain_clean_' + side.to_s, porcelain_clean_list, :id,
                           :condition, {:include_blank => true})
  end

  def oil_fail_hv_label
    oil_fail_label :hv
  end

  def oil_fail_lv_label
    oil_fail_label :lv
  end

  def oil_fail_tv_label
    oil_fail_label :tv
  end

  def oil_fail_label(side)
    label :bushing_condition, 'oil_fail_' + side.to_s,
      VisualInspectionCondition.
      where("name = '#{'oil_fail_' + side.to_s}' AND table_name = 'bushing_conditions'").
      first.description
  end

  def oil_fail_hv_select_list(form)
   oil_fail_select_list form, :hv 
  end

  def oil_fail_lv_select_list(form)
   oil_fail_select_list form, :lv 
  end

  def oil_fail_tv_select_list(form)
   oil_fail_select_list form, :tv 
  end

  def oil_fail_select_list(form, side)
    oil_fail_list = 
      VisualInspectionCondition.
      where("name = '#{'oil_fail_' + side.to_s}' AND table_name = 'bushing_conditions'").
      order("score")
    form.collection_select('oil_fail_' + side.to_s, oil_fail_list, :id,
                           :condition, {:include_blank => true})
  end

  def oil_level_hv_label
    oil_level_label :hv
  end

  def oil_level_lv_label
    oil_level_label :lv
  end

  def oil_level_tv_label
    oil_level_label :tv
  end

  def oil_level_label(side)
    label :bushing_condition, 'oil_level_' + side.to_s,
      VisualInspectionCondition.
      where("name = '#{'oil_level_' + side.to_s}' AND table_name = 'bushing_conditions'").
      first.description
  end

  def oil_level_hv_select_list(form)
   oil_level_select_list form, :hv 
  end

  def oil_level_lv_select_list(form)
   oil_level_select_list form, :lv 
  end

  def oil_level_tv_select_list(form)
   oil_level_select_list form, :tv 
  end

  def oil_level_select_list(form, side)
    oil_level_list = 
      VisualInspectionCondition.
      where("name = '#{'oil_level_' + side.to_s}' AND table_name = 'bushing_conditions'").
      order("score")
    form.collection_select('oil_level_' + side.to_s, oil_level_list, :id,
                           :condition, {:include_blank => true})
  end

  def oil_color_hv_label
   oil_color_label :hv 
  end

  def oil_color_lv_label
   oil_color_label :lv 
  end

  def oil_color_tv_label
   oil_color_label :tv 
  end

  def oil_color_label(side)
    label :bushing_condition, 'oil_color_' + side.to_s,
      VisualInspectionCondition.
      where("name = '#{'oil_color_' + side.to_s}' AND table_name = 'bushing_conditions'").
      first.description
  end

  def oil_color_hv_select_list(form)
   oil_color_select_list form, :hv 
  end

  def oil_color_lv_select_list(form)
   oil_color_select_list form, :lv 
  end

  def oil_color_tv_select_list(form)
   oil_color_select_list form, :tv 
  end

  def oil_color_select_list(form, side)
    oil_color_list = 
      VisualInspectionCondition.
      where("name = '#{'oil_color_' + side.to_s}' AND table_name = 'bushing_conditions'").
      order("score")
    form.collection_select('oil_color_' + side.to_s, oil_color_list, :id,
                           :condition, {:include_blank => true})
  end

end
