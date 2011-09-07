class ArrestersController < ApplicationController
  def new
    @transformer = Transformer.find(params[:transformer_id])
    @arrester = Arrester.new
  end
  
  def create
    @arrester = Arrester.new(params[:arrester])
    respond_to do |format|
      if @arrester.save
        format.html {redirect_to(search_electrical_tests_path, :notice => "Data for Arrester has been saved")}
      else
        format.html {render :action => 'new'}
      end
    end
  end
end
