module TransformersHelper
  def transformer_winding_type(transformer)
    WindingType.find(transformer.winding_type_id).description
  end

end
