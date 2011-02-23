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

  # Oil DGA
  def oil_dga_drop_down_list(oil_dgas)
    collection_select(:main_tank_dga, :id, oil_dgas, :id, :thai_test_date)
  end

  def new_main_tank_dga_link(transformer)
    link_to('Add', new_transformer_oil_dga_path(transformer), :class => 'add')
  end

  def edit_main_tank_dga_link(transformer, oil_dga)
    link_to('Edit', edit_transformer_oil_dga_path(transformer, oil_dga),
            :id => "main_tank_dga_edit", :class => 'edit')
  end

  def delete_main_tank_dga_link(transformer, oil_dga)
    link_to('Delete', transformer_oil_dga_path(transformer, oil_dga),
            :confirm => 'Are you sure?', :method => :delete, 
            :id => "main_tank_dga_delete", :class => 'delete')
  end

  # OLTC Dga
  def oltc_dga_drop_down_list
    collection_select(:oltc_dga, :id, @oltc_dgas, :id, :thai_test_date)
  end

  def new_oltc_dga_link
    link_to('Add', new_transformer_oltc_dga_path(@transformer), :class => 'add')
  end

  def edit_oltc_dga_link
    unless @oltc_dgas.blank?
      link_to('Edit',
              edit_transformer_oltc_dga_path(@transformer, @oltc_dgas.first),
              :id => "oltc_dga_edit", :class => 'edit')
    else
      link_to("Edit", "#", :class => "edit")
    end
  end

  def delete_oltc_dga_link
    unless @oltc_dgas.blank?
      link_to('Delete',
              transformer_oltc_dga_path(@transformer, @oil_dgas.first),
              :confirm => 'Are you sure?', :method => :delete, 
              :id => "oltc_dga_delete", :class => 'delete')
    else
      link_to("Edit", "#", :class => "delete")
    end
  end



end
