class VisualInspectionsController < ApplicationController
  def index
    @transformer = Transformer.find(params[:transformer_id])
  end
  
  def search
    @transformers = Transformer.all
  end
  
  def new
    @transformer = Transformer.find(params[:transformer_id])
    @visual_inspection = VisualInspection.new
    @visual_inspection.build_general_condition
  end
  
  def create
    debugger
    @visual_inspection = VisualInspection.new(params[:visual_inspection])      
    if @visual_inspection.save
      flash[:notice] = "Successfully created general condition"
      redirect_to search_visual_inspections_path
    else
      render :controller => 'visual_inspection', :action => 'new'
    end    
  end
end
