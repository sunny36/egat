# == Schema Information
# Schema version: 20110215204448
#
# Table name: regulating_pt_factors
#
#  id         :integer(4)      not null, primary key
#  hi_factor  :integer(4)
#  condition  :string(255)
#  start      :integer(4)
#  end        :integer(4)
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class RegulatingPtFactor < ActiveRecord::Base
end
