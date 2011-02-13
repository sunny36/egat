class MainTanksController < ApplicationController
  def index
    @main_tank = MainTank.where("visual_inspection_id = ?",
                                params[:visual_inspection_id]).first
  end

end
