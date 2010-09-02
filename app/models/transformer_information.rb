class TransformerInformation < ActiveRecord::Base
  belongs_to :bus_voltage_hv
  belongs_to :bus_voltage_lv
  belongs_to :probability_of_force_outage
  belongs_to :social_aspect, :class_name => "SocialAspect", :foreign_key => "social_aspect_id"
  belongs_to :system_location, :class_name => "SystemLocation", :foreign_key => "system_location_id"
  belongs_to :application_use, :class_name => "ApplicationUse", :foreign_key => "application_use_id"
  belongs_to :system_stability, :class_name => "SystemStability", :foreign_key => "system_stability_id"
  belongs_to :pollution, :class_name => "Pollution", :foreign_key => "pollution_id"
  belongs_to :n1_criteria, :class_name => "N1Criteria", :foreign_key => "n1_criteria_id"
  #enum_attr :public_image, %w(yes no)
  
  
end
