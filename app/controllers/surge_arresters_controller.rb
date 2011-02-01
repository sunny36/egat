class SurgeArrestersController < ApplicationController
  def new
    @transformer = Transformer.find(params[:transformer_id])
    @surge_arrester = SurgeArrester.new
  end
  
end
