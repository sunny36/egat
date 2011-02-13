class ConservatorTanksController < ApplicationController  
  def index
    @conservator_tank =
      ConservatorTank.where("visual_inspection_id = ?",
                            params[:visual_inspection_id]).first
  end

end
