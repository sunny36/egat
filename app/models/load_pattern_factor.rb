# == Schema Information
# Schema version: 20101205200640
#
# Table name: load_pattern_factors
#
#  id            :integer(4)      not null, primary key
#  start         :integer(4)
#  end           :integer(4)
#  score         :integer(4)
#  score_message :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class LoadPatternFactor < ActiveRecord::Base
  has_many :load_pattern_per_year
end
