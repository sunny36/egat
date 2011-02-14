module OilInputHelper
  include TransformersHelper
  
  def javascript_includes
    javascript_include_tag('jquery-ui-1.8.4.custom.min',
                           'ext-jquery-adapter', 'ext-all',
                           'jquery.url',
                           'controllers/oil_input')
  end
  
  def transformer_names_drop_down_list(form, selected=nil)
    @transformers = Transformer.order("transformer_name").all
    form.collection_select(:transformer_id,  @transformers, :id,
                           :transformer_name,
                           {:include_blank => true, :selected => selected})
  end

  def main_tank_dga_drop_down_list
    select_tag 'main_tank_dga',
      options_from_collection_for_select(OilDga.all, "id", "test_date")
  end

  def new_main_tank_dga_link(transformer)
    link_to('Add', new_transformer_oil_dga_path(transformer), :class => 'add')
  end

  def edit_main_tank_dga_link(transformer, oil_dga)
    link_to('Edit', edit_transformer_oil_dga_path(transformer, oil_dga),
            :class => 'edit')
  end

  def delete_main_tank_dga_link(transformer, oil_dga)
    link_to('Delete', transformer_oil_dga_path(transformer, oil_dga),
            :confirm => 'Are you sure?', :method => :delete, :class => 'delete')
  end

  def oil_dga_drop_down_list(oil_dgas)
    collection_select(:main_tank_dga, :id, oil_dgas, :id, :thai_test_date)
  end

end
