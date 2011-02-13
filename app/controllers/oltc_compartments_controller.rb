class OltcCompartmentsController < ApplicationController
  def index
    @oltc_compartment = OltcCompartment.where("visual_inspection_id = ?",
                                              params[:visual_inspection_id]).first
  end

end
