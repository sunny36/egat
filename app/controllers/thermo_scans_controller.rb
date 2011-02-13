class ThermoScansController < ApplicationController
  def index
    @thermo_scan =
      ThermoScan.where("visual_inspection_id = ?",
                       params[:visual_inspection_id]).first
  end

end
