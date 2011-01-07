module OilDgasHelper
  def hif_color

  end

  def transformer_name_select(form)
    @transformers = Transformer.order("transformer_name").all
    form.collection_select(
      :transformer_id,  @transformers, :id, :transformer_name, 
      {:include_blank => true}) 

  end
end
