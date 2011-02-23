module OltcDgasHelper
  include TransformersHelper
  def transformer_name_select(form)
    @transformers = Transformer.order("transformer_name").all
    form.collection_select(
      :transformer_id,  @transformers, :id, :transformer_name, 
      {:include_blank => true}) 

  end
  
  def hi_factor_color
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{OltcDgaFactor.color(@transformer.id)});\"></span>".html_safe
  end
  
end
