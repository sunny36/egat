# == Schema Information
# Schema version: 20101205200640
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
#

class HifOfOilDga < ActiveRecord::Base
end
