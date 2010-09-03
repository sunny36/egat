class LoadPatternPerYear < ActiveRecord::Base
  belongs_to :TransformerInformation
  belongs_to :LoadPatterFactor
end
