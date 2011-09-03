class BushingTestsController < ApplicationController
  
  def index
    @transformer = Transformer.find(params[:transformer_id])
    @bushing_test = BushingTest.where(:transformer_id => params[:transformer_id]).order("test_date DESC").first
  end

  def new
    @transformer = Transformer.find(params[:transformer_id])
    @bushing_test = BushingTest.new 
  end

  def create
    @bushing_test = BushingTest.new(params[:bushing_test])
    respond_to do |format|
      if @bushing_test.save
        format.html {
          redirect_to(search_visual_inspections_path, :notice => "Data for Visual Inspection has been added")
        }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
