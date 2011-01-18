module VisualInspectionsHelper
  include GeneralConditionsHelper
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
            transformer_visual_inspection_path(transformer,
                                               visual_inspection),
            :confirm => 'Are you sure?', :method => :delete, :class => 'delete')
  end
  
  def show_visual_inspection_link(transformer, visual_inspection)
    link_to('Show', transformer_visual_inspection_path(transformer, visual_inspection))
  end
end
