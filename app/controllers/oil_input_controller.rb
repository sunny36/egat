class OilInputController < ApplicationController
  def index
    @transformer = Transformer.find_by_id(params[:transformer_id])
    @oil_dgas = OilDga.where(:transformer_id => params[:transformer_id]).order("test_date DESC")
    @oltc_dgas = OltcDga.where('transformer_id = ?', params[:transformer_id]).order("test_date DESC")
    debugger
    @furans = Furan.where('transformer_id = ?', params[:transformer_id]).order('test_date DESC')
    @oil_contaminations = OilContamination.where('transformer_id = ?',params[:transformer_id]).order('test_date DESC')
    @oltc_oil_contaminations = OltcOilContamination.where('transformer_id = ?', params[:transformer_id]).order('test_date DESC')
  end

  def show
    @transformer = Transformer.find_by_transformer_name(params[:id])
  end

  def search
    @transformers = Transformer.all
  end

end
