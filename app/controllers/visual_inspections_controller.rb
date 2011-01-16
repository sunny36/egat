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
    @visual_inspection = VisualInspection.new(params[:visual_inspection])
    respond_to do |format|
      if @visual_inspection.save
        format.html {
          redirect_to(search_visual_inspections_path,
                      :notice => "Data for Visual Inspection has been added")
        }
      else
        format.html { render :action => "new" }
      end
    end
  end

end
