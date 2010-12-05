class Gas < ActiveRecord::Base
  has_many :dga_gas_scores
  
  def self.weight(gas)
    DgaGasScore.joins(:gas).where("gas.name = ?", gas).first.weight.to_i
  end
end
