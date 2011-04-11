class LoadHistoriesController < ApplicationController
  def index
    @general_condition = 
      GeneralCondition.where("visual_inspection_id = ?", params[:visual_inspection_id]).order("test_date DESC").first
  end
end
