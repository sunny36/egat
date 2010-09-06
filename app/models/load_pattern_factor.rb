# == Schema Information
# Schema version: 20100906080424
#
# Table name: load_pattern_factors
#
#  id            :integer         not null, primary key
#  start         :integer
#  end           :integer
#  score         :integer
#  score_message :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class LoadPatternFactor < ActiveRecord::Base
  @@WEIGHT = 4
  has_many :load_pattern_per_year
end
