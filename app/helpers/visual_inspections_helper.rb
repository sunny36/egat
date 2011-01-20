module VisualInspectionsHelper

  include TransformersHelper


  def javascript_includes
    javascript_include_tag('jquery-ui-1.8.4.custom.min',
                           'ext-jquery-adapter', 'ext-all',
                           'jquery.url',
                           'controllers/visual_inspection')
  end

  def transformer_names_drop_down_list(form, id, selected=nil)
    @transformers = Transformer.order("transformer_name").all
    form.collection_select(id,  @transformers, :id,
                           :transformer_name,
                           {:include_blank => true, :selected => selected})
  end

  def vector_group(transformer)
    unless transformer.vector_group.nil?
      transformer.vector_group
    else
      "-"
    end
  end

  def edit_visual_inspection_link(transformer, visual_inspection)
    link_to('Edit',
            edit_transformer_visual_inspection_path(transformer,
                                                    visual_inspection),
                                                    :class => 'edit')
  end

  def delete_visual_inspection_link(transformer, visual_inspection)
    link_to('Delete',
            transformer_visual_inspection_path(
              transformer, visual_inspection),
              :confirm => 'Are you sure?', :method => :delete, 
              :class => 'delete')
  end

  def show_visual_inspection_link(transformer, visual_inspection)
    link_to('Show', transformer_visual_inspection_path(transformer, visual_inspection))
  end

  def label_for(field_name, table_name, form, required = true)
    label_string = 
      VisualInspectionCondition.where("table_name = ? AND name = ?", 
                                      table_name.to_s, field_name.to_s).
                                      first.description
    label_string = label_string + " *" if required
    form.label field_name, label_string
  end

  def select_list_for(field_name, table_name, form)
    if field_name == :general_conditions && field_name == :maxload
      return general_conditions_max_load_select_list
    end
    list = 
      VisualInspectionCondition.where("table_name = ? AND name = ?", 
                                      table_name.to_s, field_name.to_s).
                                      order("score")
    form.collection_select(field_name, list, :id, :condition,
                           {:include_blank => true})
  end

  def general_conditions_max_load_select_list(form)
    maxload_list = VisualInspectionCondition.
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

  def description_for(field_name, table_name, remove_leading_number = true)
    description = VisualInspectionCondition.where("name = ? AND table_name = ?", 
                                                  field_name.to_s, 
                                                  table_name.to_s).
                                                  first.description
    if remove_leading_number
      description.split(" ", 2).second
    else 
      description
    end
  end

  def condition(visual_inspection, klass, field_name)
    id = klass.find_by_visual_inspection_id(visual_inspection.id).
      send(field_name.to_s)
    visual_inspection_condition = VisualInspectionCondition.find(id)
    unless (visual_inspection_condition.start.nil? && 
            visual_inspection_condition.end.nil?)
      if visual_inspection_condition.start == 0
        condition = "<=#{visual_inspection_condition.end}%"
      elsif visual_inspection_condition.end.nil?
        condition = ">#{visual_inspection_condition.start - 1}%"
      else
        condition = 
          "#{visual_inspection_condition.start} - #{visual_inspection_condition.end}"
      end
    else
      condition = visual_inspection_condition.condition
    end
    return condition
  end


end
