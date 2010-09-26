class ApplicationUsesController < ApplicationController
  def index
    @application_uses = ApplicationUse.all
    respond_to do |format|
      format.html 
      format.xml { render :partial => "index.xml.builder", :layout => false }
    end
  end

  def update
    @application_use = ApplicationUse.find(params[:id])
    params[:application_use] = { 
      :value => params[:value], 
      :score => params[:score], 
      :score_message => params[:score_message] 
    }
    @application_use.update_attributes(params[:application_use])
  end

end
