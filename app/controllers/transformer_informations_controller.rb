class TransformerInformationsController < ApplicationController
  def index
    @transformer_informations = TransformerInformation.all
  end
  
  def show
    @transformer_information = TransformerInformation.find(params[:id])
  end
  
  def new
    @transformer_information = TransformerInformation.new
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
