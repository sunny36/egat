class OltcControlCabinetsController < ApplicationController
  def index
    @oltc_control_cabinet = 
      OltcControlCabinet.where("visual_inspection_id = ?",
                               params[:visual_inspection_id]).first
  end

end
