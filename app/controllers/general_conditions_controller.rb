class GeneralConditionsController < ApplicationController

  def index
    debugger
    @general_condition = 
      GeneralCondition.where("visual_inspection_id = ?", params[:visual_inspection_id]).
      order("test_date DESC").first
  end
  
  def new
    @transformer = Transformer.find(params[:transformer_id])
    @general_condition = GeneralCondition.new
  end
  
  
  def create
    @transformer = Transformer.find(params[:transformer_id])
    @transformer.general_condition.build(params[:general_condtion])
    if @transformer.save
      flash[:notice] = "Successfully created general condtion."
      redirect_to transformer_informations_url
    else                
      render :action => 'new'      
    end
  end
end
