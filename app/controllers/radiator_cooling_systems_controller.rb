class RadiatorCoolingSystemsController < ApplicationController
  def index
    @radiator_cooling_system =
      RadiatorCoolingSystem.where("visual_inspection_id = ?",
                                  params[:visual_inspection_id]).first
  end

end
