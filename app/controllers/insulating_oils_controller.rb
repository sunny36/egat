class InsulatingOilsController < ApplicationController
  def new
    @transformer = Transformer.find(params[:transformer_id])
    @insulating_oil = InsulatingOil.new
  end

  def create
    @transformer = Transformer.find(params[:transformer_id])
    @insulating_oil = InsulatingOil.new(params[:insulating_oil])
    respond_to do |format|
      if @insulating_oil.save
        format.html {
          redirect_to(search_electrical_tests_path,
                      :notice => "Data for Insulating Oil has been saved")
        }
      else
        format.html {render :action => 'new'}
      end
    end
  end

  def edit
    @transformer = Transformer.find(params[:transformer_id])
    @insulating_oil = InsulatingOil.find(params[:id])
  end

  def update
    @transformer = Transformer.find(params[:transformer_id])
    @insulating_oil = InsulatingOil.find(params[:id])
    respond_to do |format|
      if @insulating_oil.update_attributes(params[:insulating_oil])
        format.html {
          redirect_to(transformer_electrical_tests_path(@transformer),
                      :notice => 'Insulating Oil was successfully updated.')
        }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @transformer = Transformer.find(params[:transformer_id])
    @insulating_oil = InsulatingOil.find(params[:id])
    @insulating_oil.destroy
    respond_to do |format|
      format.html {
        redirect_to(transformer_electrical_tests_path(@transformer))
      }
    end
  end

end
