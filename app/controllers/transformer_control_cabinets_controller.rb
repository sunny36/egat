class TransformerControlCabinetsController < ApplicationController
  def index
    @transformer_control_cabinet =
      TransformerControlCabinet.where("visual_inspection_id = ?",
                                      params[:visual_inspection_id]).first
  end

end
