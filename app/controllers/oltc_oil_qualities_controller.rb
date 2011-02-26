class OltcOilQualitiesController < ApplicationController
  def index
    @transformer = Transformer.find(params[:transformer_id])
    @oltc_oil_qualities = OltcOilQuality.find_all_by_name_and_transformer(params[:name], @transformer)
    @insulating_oil = InsulatingOil.most_recent(params[:transformer_id]).first
    @oltc_oil_contamination = OltcOilContamination.most_recent(params[:transformer_id]).first    
    respond_to do |format|
      format.html
      ActiveRecord::Base.include_root_in_json = false
      format.js { render :json => @oltc_oil_qualities.to_json(:include => [:color]) }
    end

  end
end
