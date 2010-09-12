class TransformerInformationsController < ApplicationController
  def index
    if request.xhr?
      @data_points = TransformerInformation.get_data_points.to_json
    else 
      @transformer_informations = TransformerInformation.all
    end
    respond_to do |format|
      format.html 
      format.js 
    end
  end
  
  def show
    @transformer_information = TransformerInformation.find(params[:id])
  end
  
  def new
    @transformer_information = TransformerInformation.new
    @transformer_information.build_load_pattern_per_year
  end
  
  def create
    @transformer_information = TransformerInformation.new(params[:transformer_information])
    if @transformer_information.save
      flash[:notice] = "Successfully created transformer information."
      redirect_to transformer_informations_url
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
      redirect_to transformer_informations_url
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

  def redirect_to_edit_if_exists
    if request.xhr?
      @transformer_information = TransformerInformation.find_by_transformer_id(params[:id])
    end
    respond_to do |format|
      format.html 
      format.js 
    end
  end
end
