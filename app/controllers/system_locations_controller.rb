class SystemLocationsController < ApplicationController  
  def index
    @system_locations = SystemLocation.all
    respond_to do |format|
      format.html 
      format.xml { render :partial => "index.xml.builder", :layout => false }
    end
  end

  def edit
    debugger
  end

  def update
    @system_location = SystemLocation.find(params[:id])
    params[:system_location] = { 
      :value => params[:value], 
      :score => params[:score], 
      :score_message => params[:score_message] 
    }
    @system_location.update_attributes(params[:system_location])
  end
end
