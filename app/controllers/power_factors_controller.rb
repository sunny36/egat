class PowerFactorsController < ApplicationController
  def index
    @transformer = Transformer.find(params[:transformer_id])
    @insulating_oils = 
      InsulatingOil.where("transformer_id =?",
                          params[:transformer_id]).order("test_date DESC")
    respond_to do |format|
      format.html
      ActiveRecord::Base.include_root_in_json = false
      format.js {
        render :json => @insulating_oils.to_json(
        :only => [:id, :test_date, :transformer_id],
        :methods => [:cor_percent_power_factor_maintank, :test_date_for_floth])
      }
    end
  end
end
