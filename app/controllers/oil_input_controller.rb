class OilInputController < ApplicationController
  def index
    
  end

  def show
    @transformer = Transformer.find_by_transformer_name(params[:id])
  end
end
