class OverallConditionsController < ApplicationController
  def index
    @transformer = Transformer.find(params[:transformer_id])
    @visual_inspection =
      VisualInspection.where("transformer_id = ?",params[:transformer_id]).
      order("test_date DESC").first
    if request.xhr?
      @no_js = true
      @no_header = true
      @no_footer = true
    end
    respond_to do |format|
      format.html
    end
  end
end
