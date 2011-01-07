module OilDgasHelper
  def hif_color(hif_of_oil_dga, oil_dgas)   
    return link_to "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{hif_of_oil_dga.color});\"></span>".html_safe,
                    graph_transformer_oil_dgas_path(oil_dgas.first.transformer)
  end

  def transformer_name_select(form)
    @transformers = Transformer.order("transformer_name").all
    form.collection_select(
      :transformer_id,  @transformers, :id, :transformer_name, 
      {:include_blank => true}) 

  end
end
