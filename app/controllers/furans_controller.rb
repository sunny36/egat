class FuransController < ApplicationController
  def new
    @transformer = Transformer.find(params[:transformer_id])
    @furan = Furan.new
  end

  def create
    @transformer = Transformer.find(params[:transformer_id])
    @furan = Furan.new(params[:furan])
    respond_to do |format|
      if @furan.save
        format.html {
          redirect_to(transformer_oil_input_index_path(@transformer),
                      :notice => 'Data for Furan has been added.')
        }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    @transformer = Transformer.find_by_id(params[:transformer_id])
    @furan = Furan.find(params[:id])
  end

  def update
    @transformer = Transformer.find(params[:transformer_id])
    @furan = Furan.find(params[:id])
    respond_to do |format|
      if @furan.update_attributes(params[:furan])
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
    @furan = Furan.find(params[:id])
    @furan.destroy
    respond_to do |format|
      format.html {
        redirect_to(transformer_oil_input_index_path(@transformer))
      }
    end
  end

end
