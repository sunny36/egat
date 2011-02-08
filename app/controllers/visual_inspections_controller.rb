class VisualInspectionsController < ApplicationController
  def index
    @transformer = Transformer.find(params[:transformer_id])
    @visual_inspections =
      VisualInspection.where("transformer_id = ?", params[:transformer_id])
  end

  def search
    @transformers = Transformer.all
  end

  def new
    @transformer = Transformer.find(params[:transformer_id])
    @visual_inspection = VisualInspection.new
    @visual_inspection.build_general_condition
    @visual_inspection.build_bushing_condition
    @visual_inspection.build_surge_arrester
    @visual_inspection.build_conservator_tank
    @visual_inspection.build_main_tank
    @visual_inspection.build_hot_line_oil_filter
    @visual_inspection.build_radiator_cooling_system
    @visual_inspection.build_transformer_control_cabinet
    @visual_inspection.build_ngr
    @visual_inspection.build_regulating_pt
    @visual_inspection.build_oltc_compartment
    @visual_inspection.build_oltc_control_cabinet
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

  def edit
    @visual_inspection = VisualInspection.find(params[:id])
  end

  def update
    @visual_inspection = VisualInspection.find(params[:id])
    respond_to do |format|
      if @visual_inspection.update_attributes(params[:visual_inspection])
        transformer = Transformer.find(@visual_inspection.transformer_id)
        format.html {
          redirect_to(transformer_visual_inspections_path(transformer),
                      :notice => "Data for Visual Inspection has been updated")
        }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @visual_inspection = VisualInspection.find(params[:id])
    transformer = Transformer.find(@visual_inspection.transformer_id)
    @visual_inspection.destroy
    respond_to do |format|
      format.html { redirect_to(transformer_visual_inspections_path(transformer)) }
    end
  end

  def show
    @visual_inspection = VisualInspection.where("id = ? AND transformer_id = ?",
                                                params[:id], 
                                                params[:transformer_id]).first
    respond_to do |format| 
      format.html
    end
  end
end
