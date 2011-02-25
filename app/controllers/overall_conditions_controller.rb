class OverallConditionsController < ApplicationController
  def index
    @transformer = Transformer.find(params[:transformer_id])
    @oil_dgas = OilDga.where("transformer_id = ?", params[:transformer_id]).order("test_date DESC")
    @visual_inspection = VisualInspection.where("transformer_id = ?",
                                                params[:transformer_id]).order("test_date DESC").first
    @thermo_scan = ThermoScan.most_recent(@transformer)
    @hot_line_oil_filter = HotLineOilFilter.most_recent(@transformer)
    @ngr = Ngr.most_recent(@transformer)
    @regulating_pt = RegulatingPt.most_recent(@transformer)
    # @insulating_oils = InsulatingOil.where("transformer_id = ?", params[:transformer_id]).order("test_date DESC")
    @insulating_oil = InsulatingOil.most_recent(params[:transformer_id]).first
    @oltc_oil_contamination = OltcOilContamination.most_recent(params[:transformer_id]).first
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
