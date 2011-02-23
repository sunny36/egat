class FuransController < ApplicationController
  def new
    @transformer = Transformer.find(params[:transformer_id])
    @furan = Furan.new
  end
  
end
