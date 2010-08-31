class TransformersController < ApplicationController

  def index
    @transformers = Transformer.all
    respond_to do |format|
      format.html 
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
