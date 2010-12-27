# == Schema Information
# Schema version: 20101205200640
#
# Table name: gas
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Gas < ActiveRecord::Base
  has_many :dga_gas_scores
  
  def self.weight(gas)
    DgaGasScore.joins(:gas).where("gas.name = ?", gas).first.weight.to_i
  end
end
