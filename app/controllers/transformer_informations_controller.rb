class TransformerInformationsController < ApplicationController
  def index
    if request.xhr?
      if params[:region]
        @stations = Station.find_all_by_region(params[:region])
        names = @stations.collect { |s| s.name }
        transformers = Transformer.find_all_by_transformer_name_initials(names)
        @data_points =
          TransformerInformation.get_data_points_by_transformers(transformers)
        @data_points = @data_points.to_json
      elsif params[:transformer_id]
        transformer_id = params[:transformer_id]
        @data_points =
          TransformerInformation.get_data_points_by_transformer_id(transformer_id)
        @data_points = @data_points.to_json        
      else
        @data_points = TransformerInformation.get_data_points.to_json
      end      
    else 
      @transformer_informations = TransformerInformation.all
    end
    respond_to do |format|
      format.html 
      format.js 
    end
  end
  
  def show
    if request.xhr?
      @no_js = true
      @no_header = true
      @no_footer = true
    end
    @transformer_information = TransformerInformation.find(params[:id])
  end
  
  def new
    @transformer_information = TransformerInformation.new
    @transformer_information.build_load_pattern_per_year
  end
  
  def create
    @transformer_information =
      TransformerInformation.new(params[:transformer_information])
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
      @transformer_information =
        TransformerInformation.find_by_transformer_id(params[:id])
    end
    respond_to do |format|
      format.html 
      format.js 
    end
  end
  
  def search 
    if params[:transformer_id]
      @transformer_informations = 
        TransformerInformation.find_all_by_transformer_id(params[:transformer_id])
    end
  end
end
