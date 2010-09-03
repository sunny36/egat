class TransformerInformationsController < ApplicationController
  def index
    @transformer_informations = TransformerInformation.all
  end
  
  def show
    @transformer_information = TransformerInformation.find(params[:id])
  end
  
  def new
    @transformer_information = TransformerInformation.new
    @transformer_information.build_load_pattern_per_year
    @bus_voltage_hvs = BusVoltageHv.find(:all, :order => 'value')
    @bus_voltage_lvs = BusVoltageLv.find(:all, :order => 'value')
    @probability_of_force_outages = ProbabilityOfForceOutage.find(:all, :order => 'value')    
    @social_aspects = SocialAspect.find(:all, :order => 'value')
    @system_locations = SystemLocation.find(:all, :order => 'value')
    @public_images = PublicImage.find(:all, :order => 'value')
    @n1_criterias = N1Criteria.find(:all, :conditions => "value IS NOT NULL", :order => 'value')
    @application_uses = ApplicationUse.find(:all, :conditions => "value IS NOT NULL", :order => 'value')
    @system_stabilities = SystemStability.find(:all, :conditions => "value IS NOT NULL", :order => 'value')
    @pollutions = Pollution.find(:all, :order => 'value')
  end
  
  def create
    @transformer_information = TransformerInformation.new(params[:transformer_information])
    if @transformer_information.save
      flash[:notice] = "Successfully created transformer information."
      redirect_to @transformer_information
    else
      render :action => 'new'
    end
  end
  
  def edit
    @transformer_information = TransformerInformation.find(params[:id])
  end
  
  def update
    @transformer_information = TransformerInformation.find(params[:id])
    if @transformer_information.update_attributes(params[:transformer_information])
      flash[:notice] = "Successfully updated transformer information."
      redirect_to @transformer_information
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @transformer_information = TransformerInformation.find(params[:id])
    @transformer_information.destroy
    flash[:notice] = "Successfully destroyed transformer information."
    redirect_to transformer_informations_url
  end
end
