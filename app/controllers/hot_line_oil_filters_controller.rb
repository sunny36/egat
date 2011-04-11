class HotLineOilFiltersController < ApplicationController
  def index
    @hot_line_oil_filter = HotLineOilFilter.where("visual_inspection_id = ?", params[:visual_inspection_id]).first
  end

end
