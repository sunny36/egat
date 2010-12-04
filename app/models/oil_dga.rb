class OilDga < ActiveRecord::Base
  def before_save
    dga_gas_scores = DgaGasScore.all
  end
end
