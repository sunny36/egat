module ElectricalTestsHelper
  include TransformersHelper

  def javascript_includes
    javascript_include_tag('jquery-ui-1.8.4.custom.min','ext-jquery-adapter', 'ext-all', 'jquery.url', 
                           'controllers/electrical_tests')
  end

  def transformer_names_drop_down_list(form, selected=nil)
    @transformers = Transformer.order("transformer_name").all
    form.collection_select(:transformer_id,  @transformers, :id, :transformer_name, 
                           {:include_blank => true, :selected => selected})
  end

  def new_insulating_oil_link(transformer)
    link_to('Add', new_transformer_insulating_oil_path(transformer), :class => 'add')
  end

  def edit_insulating_oil_link(transformer, insulating_oil)
    link_to('Edit', edit_transformer_insulating_oil_path(transformer, insulating_oil), :class => 'edit')
  end

  def delete_insulating_oil_link(transformer, insulating_oil)
    link_to('Delete', transformer_insulating_oil_path(transformer, insulating_oil), :confirm => 'Are you sure?', 
            :method => :delete, :class => 'delete')
  end

  def insulating_oil_drop_down_list
    collection_select(:insulating_oil, :id, @insulating_oils, :id, :thai_test_date)
  end

  def transformer_details_partial
    render :partial => 'transformer_details', :locals => {:transformer => @transformer}
  end
  
  def bushing_test_drop_down_list
    collection_select(:bushing_test, :id, @bushing_tests, :id, :thai_test_date)
  end
  
  def new_bushing_test_link
    link_to('Add', new_transformer_bushing_test_path(@transformer), class: 'add')
  end
  
  def edit_bushing_test_link
    unless @bushing_tests.blank?
      link_to('Edit', edit_transformer_bushing_test_path(@transformer, @bushing_tests.first), class: 'edit')
    else
      link_to("Edit", "#", :class => "edit")
    end
  end
  
  def delete_bushing_test_link
    unless @bushing_tests.blank?
      link_to('Delete', transformer_bushing_test_path(@transformer, @bushing_tests.first), confirm: 'Are you sure?', 
              method: :delete, class: 'delete')
    else
      link_to('Delete', "#", :class => "delete")
    end
  end

  def arrester_drop_down_list
    collection_select(:arrester, :id, @arresters, :id, :thai_test_date)
  end

  def new_arrester_link
    link_to('Add', new_transformer_arrester_path(@transformer), class: 'add')
  end
  
  def edit_arrester_link
    unless @arresters.blank?
      link_to('Edit', edit_transformer_arrester_path(@transformer, @arresters.first), class: 'edit')
    else
      link_to("Edit", "#", :class => "edit")
    end
  end
  
  def delete_arrester_link
    unless @arresters.blank?
      link_to('Delete', transformer_arrester_path(@transformer, @arresters.first), confirm: 'Are you sure?', 
              method: :delete, class: 'delete')
    else
      link_to('Delete', "#", :class => "delete")
    end
  end

end
