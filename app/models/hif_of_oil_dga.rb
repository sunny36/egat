# == Schema Information
# Schema version: 20110111130021
#
# Table name: hif_of_oil_dgas
#
#  id                 :integer(4)      not null, primary key
#  hi_factor          :integer(4)
#  condition          :string(255)
#  percent_dgaf_start :integer(4)
#  percent_dgaf_end   :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#  color              :string(255)
#

class HifOfOilDga < ActiveRecord::Base
end
