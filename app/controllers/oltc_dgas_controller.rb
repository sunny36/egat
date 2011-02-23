class OltcDgasController < ApplicationController
  def new
    @transformer = Transformer.find(params[:transformer_id])
    @oltc_dga = OltcDga.new
  end
  
  def create
    @transformer = Transformer.find(params[:transformer_id])
    @oltc_dga = OltcDga.new(params[:oltc_dga])
    respond_to do |format|
      if @oltc_dga.save
        format.html {
          redirect_to(search_oil_input_index_path,
                      :notice => 'Data for OLTC Dga has been added.')
        }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def edit
    @transformer = Transformer.find_by_id(params[:transformer_id])
    @oltc_dga = OltcDga.find(params[:id])
  end
  
  def update
    @transformer = Transformer.find(params[:transformer_id])
    @oltc_dga = OltcDga.find(params[:id])
    respond_to do |format|
      if @oltc_dga.update_attributes(params[:oltc_dga])
        format.html {
          redirect_to(transformer_oil_input_index_path(@transformer),
                      :notice => 'OLTC DGA was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @transformer = Transformer.find(params[:transformer_id])
    @oltc_dga = OltcDga.find(params[:id])
    @oltc_dga.destroy
    respond_to do |format|
      format.html {
        redirect_to(transformer_oil_input_index_path(@transformer))
      }
    end
  end
  
end
