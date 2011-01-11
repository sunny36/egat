class VisualInspectionCondition < ActiveRecord::Base
  belongs_to :visual_inspection, :class_name => "VisualInspection", 
             :foreign_key => "visual_inspection_id"
end
