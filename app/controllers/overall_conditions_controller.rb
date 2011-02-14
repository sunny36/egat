class OverallConditionsController < ApplicationController
  def index
    @transformer = Transformer.find(params[:transformer_id])
    @oil_dgas = OilDga.where("transformer_id = ?",
                            params[:transformer_id]).order("test_date DESC")
    @visual_inspection =
      VisualInspection.where("transformer_id = ?",
                             params[:transformer_id]).
      order("test_date DESC").first
    @thermo_scan = ThermoScan.most_recent(@transformer)
    @hot_line_oil_filter = HotLineOilFilter.most_recent(@transformer)
    @ngr = Ngr.most_recent(@transformer)
    @regulating_pt = RegulatingPt.most_recent(@transformer)
    if request.xhr?
      @no_js = true
      @no_header = true
      @no_footer = true
    end
    respond_to do |format|
      format.html
    end
  end
end
