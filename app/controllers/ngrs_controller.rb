class NgrsController < ApplicationController

  def index
    @ngr = Ngr.where("visual_inspection_id = ?",
                     params[:visual_inspection_id]).first
  end

end
