module ArrestersHelper
  def transformer_names_drop_down_list(form, id)
    @transformers = Transformer.order("transformer_name").all
    form.collection_select(id,  @transformers, :id, :transformer_name, {:include_blank => true})
  end
  
  def condition_color(hif)   
    background = BushingTestFactor.where(:hi_factor => hif).first.color.value
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(#{background});\"></span>".html_safe
  end
  
end
