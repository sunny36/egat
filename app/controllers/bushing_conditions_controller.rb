class BushingConditionsController < ApplicationController
  def new
    @transformer = Transformer.find(params[:transformer_id])
    @bushing_condition = BushingCondition.new
  end

end
