class InsulatingOilsController < ApplicationController
  def new
    @transformer = Transformer.find(params[:transformer_id])
    @insulating_oil = InsulatingOil.new    
  end
end
