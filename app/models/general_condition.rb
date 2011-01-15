class GeneralCondition < ActiveRecord::Base
  belongs_to :transformer
  belongs_to :visual_inspection
end
