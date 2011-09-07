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
  
  def index
    @transformer = Transformer.find(params[:transformer_id])
    @arresters = Arrester.where(:transformer_id => params[:transformer_id]).order("test_date DESC")
    @arrester = @arresters.first
    respond_to do |format|
      format.html
      ActiveRecord::Base.include_root_in_json = false
      methods = [:test_date_for_floth, 
                 :h1_percent_leakage_current, :h2_percent_leakage_current, :h3_percent_leakage_current,
                 :h1_percent_watt_loss, :h2_percent_watt_loss, :h3_percent_watt_loss,
                 :h1_percent_insulation_resistance, :h2_percent_insulation_resistance, :h3_percent_insulation_resistance,
                 :x1_percent_leakage_current, :x2_percent_leakage_current, :x3_percent_leakage_current,
                 :x1_percent_watt_loss, :x2_percent_watt_loss, :x3_percent_watt_loss,
                 :x1_percent_insulation_resistance, :x2_percent_insulation_resistance, :x3_percent_insulation_resistance,
                 :y1_percent_leakage_current, :y2_percent_leakage_current, :y3_percent_leakage_current,
                 :y1_percent_watt_loss, :y2_percent_watt_loss, :y3_percent_watt_loss,
                 :y1_percent_insulation_resistance, :y2_percent_insulation_resistance, :y3_percent_insulation_resistance]
      format.js { render :json => @arresters.to_json(:methods => methods) 
      }
    end
  end
end
