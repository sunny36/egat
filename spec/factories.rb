Factory.define :load_pattern_per_year do |lppy|
  lppy.lteq_0_pt_6 0
  lppy.gt_0_pt_6_and_lteq_1 0
  lppy.gt_1_and_lteq_1_pt_2 0
  lppy.gt_1_pt_2_and_lteq_1_pt_5 0
  lppy.gt_1_pt_5 0
end

Factory.define :transformer_information do |ti|
  ti.transformer_id { Transformer.first.id }
  ti.recorded_date { Date.today.to_s }
  ti.bus_voltage_hv_id { BusVoltageHv.find_by_value("115") }
  ti.system_fault_level_hv 1.915
  ti.bus_voltage_lv_id { BusVoltageLv.find_by_value("22") }
  ti.system_fault_level_lv 5.3017
  damage_of_properties = []
  damage_of_property = DamageOfProperty.find_by_value("3")
  damage_of_properties << damage_of_property
  damage_of_property = DamageOfProperty.find_by_value("4")
  ti.damage_of_properties { damage_of_properties }
  ti.probability_of_force_outage { ProbabilityOfForceOutage.find_by_value("CC") }
end
