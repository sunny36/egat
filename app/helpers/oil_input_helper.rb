module OilInputHelper
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
  
  def new_main_tank_dga_link
    image = image_tag "icons/icon_addlink.gif", :id => 'main_tank_dga_add', 
                      :border=>2, :width => 15, :height => 15
    link_to image, "javascript:void(0)" 
  end

  def edit_main_tank_dga_link
    image = image_tag "icons/icon_changelink.gif", :id => 'main_tank_dga_edit', 
                      :border=>2, :width => 15, :height => 15
    link_to image, "javascript:void(0)" 
  end
  
  def delete_main_tank_dga_link
    image = image_tag "icons/icon_deletelink.gif", 
                      :id => 'main_tank_dga_delete', :border=>2, :width => 15, 
                      :height => 15
    link_to image, "javascript:void(0)" 
  end
  
end