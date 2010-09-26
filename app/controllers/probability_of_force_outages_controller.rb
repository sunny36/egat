class ProbabilityOfForceOutagesController < ApplicationController
  def index
    @probability_of_force_outages = ProbabilityOfForceOutage.all
    respond_to do |format|
      format.html 
      format.xml { render :partial => "index.xml.builder", :layout => false }
    end
  end

  def update
    @probability_of_force_outage = ProbabilityOfForceOutage.find(params[:id])
    params[:probability_of_force_outage] = { 
      :value => params[:value], 
      :score => params[:score], 
      :score_message => params[:score_message] 
    }
    @probability_of_force_outage.
      update_attributes(params[:probability_of_force_outage])
  end

end
