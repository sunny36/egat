# == Schema Information
# Schema version: 20101205200640
#
# Table name: dga_gas_scores
#
#  id            :integer(4)      not null, primary key
#  score         :integer(4)
#  score_message :string(255)
#  start         :integer(4)
#  end           :integer(4)
#  weight        :integer(4)
#  gas_id        :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

class DgaGasScore < ActiveRecord::Base
  belongs_to :gas
end
