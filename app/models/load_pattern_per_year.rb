class LoadPatternPerYear < ActiveRecord::Base
  belongs_to :transformer_information
  belongs_to :load_pattern_factor
end
