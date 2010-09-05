class TransformersController < ApplicationController

  def index
    @transformers = Transformer.find(:all, :order => "id")
    if request.xhr?
      unless params[:term].nil?
        @transformers = Transformer.find(:all, :order => "id", 
                                         :conditions => ["transformer_name like ?", 
                                                         params[:term]+"%"])
      end
      @transformers = @transformers.collect { |i| { 
        'id' => i.id, 'label' => i.transformer_name, 
        'value' => i.transformer_name 
        } 
      }
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
