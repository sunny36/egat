class RegulatingPtsController < ApplicationController
  def index
    @regulating_pt = RegulatingPt.where("visual_inspection_id = ?",
                     params[:visual_inspection_id]).first
  end

end
