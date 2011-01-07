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
end
