class OilQualitiesController < ApplicationController
  def index
    @transformer = Transformer.find(params[:transformer_id])
    unless params[:name].nil?
      @oil_qualities = OilQuality.find_all_by_name_and_transformer(params[:name], @transformer)
    else
      @oil_qualities = OilQuality.all
    end
    @insulating_oil = InsulatingOil.most_recent(params[:transformer_id]).first
    @oil_contamination = OilContamination.most_recent(params[:transformer_id]).first    
    respond_to do |format|
      format.html
      ActiveRecord::Base.include_root_in_json = false
      format.js { render :json => @oil_qualities.to_json(:include => [:color]) }
    end
  end  
end
