class OverallCondition < ActiveRecord::Base

  attr_accessor :oil_dga, :visual_inspection, :power_factor_hi_factor, :thermo_scan

  def initialize(transformer_id)
    @transformer = Transformer.find(transformer_id)
    @oil_dga = OilDga.where("transformer_id = ?", transformer_id).order("test_date DESC").first
    @visual_inspection = VisualInspection.where("transformer_id = ?", transformer_id).order("test_date DESC").first
    @thermo_scan = ThermoScan.most_recent(@transformer)
    @hot_line_oil_filter = HotLineOilFilter.most_recent(@transformer)
    @ngr = Ngr.most_recent(@transformer)
    @regulating_pt = RegulatingPt.most_recent(@transformer)
    @insulating_oil = InsulatingOil.most_recent(transformer_id).first
    @oltc_oil_contamination = OltcOilContamination.most_recent(transformer_id).first
    @oil_contamination = OilContamination.most_recent(transformer_id).first
    @power_factor_hi_factor = PowerFactor.hi_factor(transformer_id)
    @oil_quality = OilQuality.new
    @oltc_oil_quality = OltcOilQuality.new
  end

  def oil_quality_hi_factor
    @oil_quality.hi_factor(@insulating_oil, @oil_contamination)
  end

  def furan_hi_factor
    FuranFactor.hi_factor(@transformer.id)
  end

  def oltc_dga_hi_factor
    OltcDgaFactor.hi_factor(@transformer.id)
  end

  def oltc_oil_quality_hi_factor
    @oltc_oil_quality.hi_factor(@insulating_oil, @oltc_oil_contamination)
  end

  def percent_hi_others
    others_k = {:dga => 10, :load_history => 10, :power_factor => 10, :thermo_scan => 10,
                :oil_quality => 8, :furan => 6, :general_condition => 1, :bushing_condition => 5, :surge_arrester => 3,
                :conservator_tank => 1, :main_tank => 1, :hot_line_oil_filter => 1, :radiator_cooling_system => 2,
                :transformer_control_cabinet => 1, :ngr => 1, :regulating_pt => 1}
    numerator = denominator = 0
    unless @oil_dga.hi_factor.blank?
      numerator += (@oil_dga.hi_factor * others_k[:dga])
      denominator += (HifOfOilDga.order("hi_factor DESC").first.hi_factor * others_k[:dga])
    end
    unless @visual_inspection.general_condition.blank?
      numerator += (@visual_inspection.general_condition.load_history_hi_factor * others_k[:load_history])
      denominator += (LoadHistoryFactor.order("hi_factor DESC").first.hi_factor * others_k[:load_history])
    end
    unless power_factor_hi_factor.blank?
      numerator += (power_factor_hi_factor * others_k[:power_factor])
      denominator += (PowerFactor.order("hi_factor DESC").first.hi_factor * others_k[:power_factor])
    end
    unless @thermo_scan.hi_factor.blank?
      numerator += (@thermo_scan.hi_factor * others_k[:thermo_scan])
      denominator += (ThermoScanFactor.order("hi_factor DESC").first.hi_factor * others_k[:thermo_scan])
    end
    unless oil_quality_hi_factor.blank?
      numerator += (oil_quality_hi_factor * others_k[:oil_quality])
      denominator += (OilQualityFactor.order("hi_factor DESC").first.hi_factor * others_k[:oil_quality])
    end
    unless furan_hi_factor.blank?
      numerator += (furan_hi_factor * others_k[:furan])
      denominator += (FuranFactor.order("hi_factor DESC").first.hi_factor * others_k[:furan])
    end
    unless @visual_inspection.general_condition.blank?
      numerator += (@visual_inspection.general_condition.hi_factor * others_k[:general_condition])
      denominator += (GeneralConditionFactor.order("hi_factor DESC").first.hi_factor * others_k[:general_condition])
    end
    unless @visual_inspection.bushing_condition.blank?
      numerator += (@visual_inspection.bushing_condition.hi_factor * others_k[:bushing_condition])
      denominator += (BushingConditionFactor.order("hi_factor DESC").first.hi_factor * others_k[:bushing_condition])
    end
    unless @visual_inspection.surge_arrester.blank?
      numerator += (@visual_inspection.surge_arrester.hi_factor * others_k[:surge_arrester])
      denominator += (SurgeArresterFactor.order("hi_factor DESC").first.hi_factor * others_k[:surge_arrester])
    end
    unless @visual_inspection.conservator_tank.blank?
      numerator += (@visual_inspection.conservator_tank.hi_factor * others_k[:conservator_tank])
      denominator += (ConservatorTankFactor.order("hi_factor DESC").first.hi_factor * others_k[:conservator_tank])
    end
    unless @visual_inspection.main_tank.blank?
      numerator += (@visual_inspection.main_tank.hi_factor * others_k[:main_tank])
      denominator += (MainTankFactor.order("hi_factor DESC").first.hi_factor * others_k[:main_tank])
    end
    unless @visual_inspection.hot_line_oil_filter.blank?
      numerator += (@visual_inspection.hot_line_oil_filter.hi_factor * others_k[:hot_line_oil_filter])
      denominator += (HotLineOilFilterFactor.order("hi_factor DESC").first.hi_factor * others_k[:hot_line_oil_filter])
    end
    unless @visual_inspection.radiator_cooling_system.blank?
      numerator += (@visual_inspection.radiator_cooling_system.hi_factor * others_k[:radiator_cooling_system])
      denominator += (RadiatorCoolingSystemFactor.order("hi_factor DESC").first.hi_factor *
                      others_k[:radiator_cooling_system])
    end
    unless @visual_inspection.transformer_control_cabinet.blank?
      numerator += (@visual_inspection.transformer_control_cabinet.hi_factor * others_k[:transformer_control_cabinet])
      denominator += (TransformerControlCabinetFactor.order("hi_factor DESC").first.hi_factor *
                      others_k[:transformer_control_cabinet])
    end
    unless @visual_inspection.ngr.blank?
      numerator += (@visual_inspection.ngr.hi_factor * others_k[:ngr])
      denominator += (NgrFactor.order("hi_factor DESC").first.hi_factor * others_k[:ngr])
    end
    unless @visual_inspection.regulating_pt.blank?
      numerator += (@visual_inspection.regulating_pt.hi_factor * others_k[:regulating_pt])
      denominator += (RegulatingPtFactor.order("hi_factor DESC").first.hi_factor * others_k[:regulating_pt])
    end
    (numerator.to_f * 100.0) / denominator.to_f
  end

  def percent_hi_oltc
    others_oltc = {:oltc_compartment => 1, :oltc_control_cabinet => 1, :dga_of_oltc => 6, :oltc_oil_quality => 3}
    numerator = denominator = 0
    unless @visual_inspection.oltc_compartment.blank?
      numerator += (@visual_inspection.oltc_compartment.hi_factor * others_oltc[:oltc_compartment])
      denominator += (OltcCompartmentFactor.order("hi_factor DESC").first.hi_factor * others_oltc[:oltc_compartment])
    end
    unless @visual_inspection.oltc_control_cabinet.blank?
      numerator += (@visual_inspection.oltc_control_cabinet.hi_factor * others_oltc[:oltc_control_cabinet])
      denominator += (OltcControlCabinetFactor.order("hi_factor DESC").first.hi_factor *
                      others_oltc[:oltc_control_cabinet])
    end
    unless oltc_dga_hi_factor.blank?
      numerator += (oltc_dga_hi_factor * others_oltc[:dga_of_oltc])
      denominator += (OltcDgaFactor.order("hi_factor DESC").first.hi_factor * others_oltc[:dga_of_oltc])
    end
    unless oltc_oil_quality_hi_factor.blank?
      numerator += (oltc_oil_quality_hi_factor * others_oltc[:oltc_oil_quality])
      denominator += (OltcOilQualityFactor.order("hi_factor DESC").first.hi_factor * others_oltc[:oltc_oil_quality])
    end
    (numerator.to_f * 100.0) / denominator.to_f
  end

  def percent_overall_health_index
    (percent_hi_others * OverallConditionWeight.where(:name => "others").first.weight.to_f / 100) +
      (percent_hi_oltc * OverallConditionWeight.where(:name => "oltc").first.weight.to_f / 100)
  end
end
