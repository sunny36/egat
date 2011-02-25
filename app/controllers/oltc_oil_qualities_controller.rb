class OltcOilQualitiesController < ApplicationController
  def index
    @transformer = Transformer.find(params[:transformer_id])
  end
end
