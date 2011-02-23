class ElectricalTestsController < ApplicationController
  def index
    @transformer = Transformer.find_by_id(params[:transformer_id])
    @insulating_oils =
      InsulatingOil.where(:transformer_id => params[:transformer_id]).
      order("test_date DESC")
  end

  def search
    @transformers = Transformer.all
  end
end
