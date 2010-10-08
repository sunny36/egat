class TransformersController < ApplicationController

  def index    
    if request.xhr?
      unless params[:region].nil?
        stations = Station.find_all_by_region(params[:region])
        names = stations.collect { |s| s.name }
        @transformers = Transformer.find_all_by_transformer_name_initials(names)
        @transformer_informations = TransformerInformation.find_all_by_transformers(@transformers)
        ActiveRecord::Base.include_root_in_json = false        
        @transformer_informations = @transformer_informations.to_json(:only => [:id], 
                                                                      :methods => [:importance_index, :percent_hi, :d],
                                                                      :include => {:transformer => {:only => [:id, :transformer_name, :egatsn] }})
      end
      unless params[:transformer_id].nil?
        @transformer_informations = TransformerInformation.find_all_by_transformer_id(params[:transformer_id])
        ActiveRecord::Base.include_root_in_json = false        
        @transformer_informations = @transformer_informations.to_json(:only => [:id], 
                                                                      :methods => [:importance_index, :percent_hi, :d],
                                                                      :include => {:transformer => {:only => [:id, :transformer_name, :egatsn] }})        
      end
    else
      @transformers = Transformer.find(:all, :order => "id")
    end    
    respond_to do |format|
      format.html
      format.js 
    end
  end

  def edit
    @transformer = Transformer.find(params[:id])
  end
  
  def update
    @transformer = Transformer.find(params[:id])
    @transformer.brand_id = params[:transformer][:brand_id]
    respond_to do |format|
      if @transformer.save!
        format.html { redirect_to(@transformer, :notice => 'Student was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def show
    @transformer = Transformer.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
end
