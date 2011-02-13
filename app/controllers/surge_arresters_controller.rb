class SurgeArrestersController < ApplicationController
  def index
    @surge_arrester =
      SurgeArrester.where("visual_inspection_id = ?",
                          params[:visual_inspection_id]).first
  end

end
