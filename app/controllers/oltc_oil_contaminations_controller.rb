class OltcOilContaminationsController < ApplicationController

  def index
    @transformer = Transformer.find(params[:transformer_id])
    @oltc_oil_contamination = OltcOilContamination.where(:transformer_id => params[:transformer_id])
   respond_to do |format|
      format.html
      ActiveRecord::Base.include_root_in_json = false
      format.js { render :json => @oltc_oil_contamination.to_json(:methods => [:test_date_for_floth]) }
    end
  end

  def new
    @transformer = Transformer.find(params[:transformer_id])
    @oltc_oil_contamination = OltcOilContamination.new
  end

  def create
    @transformer = Transformer.find(params[:transformer_id])
    @oltc_oil_contamination = OltcOilContamination.new(params[:oltc_oil_contamination])
    respond_to do |format|
      if @oltc_oil_contamination.save
        format.html {
          redirect_to(transformer_oil_input_index_path(@transformer),
                      :notice => 'Data for OLTC Oil Contamination has been added.')
        }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    @transformer = Transformer.find_by_id(params[:transformer_id])
    @oltc_oil_contamination = OltcOilContamination.find(params[:id])
  end

  def update
    @transformer = Transformer.find(params[:transformer_id])
    @oltc_oil_contamination = OltcOilContamination.find(params[:id])
    respond_to do |format|
      if @oltc_oil_contamination.update_attributes(params[:furan])
        format.html {
          redirect_to(transformer_oil_input_index_path(@transformer),
                      :notice => 'Furan was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @transformer = Transformer.find(params[:transformer_id])
    @oltc_oil_contamination = OltcOilContamination.find(params[:id])
    @oltc_oil_contamination.destroy
    respond_to do |format|
      format.html {
        redirect_to(transformer_oil_input_index_path(@transformer))
      }
    end
  end

end
