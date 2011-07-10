class OverallCondition < ActiveRecord::Base

  attr_accessor :oil_dga, :visual_inspection, :power_factor_hi_factor, :thermo_scan

  def self.insulating_oil(transformer)
    InsulatingOil.most_recent(transformer.id).first
  end

  def self.oltc_oil_contamination(transformer)
    OltcOilContamination.most_recent(transformer.id).first
  end

  def self.oil_contamination(transformer)
    OilContamination.most_recent(transformer.id).first
  end

  def self.power_factor_hi_factor(transformer)
    PowerFactor.hi_factor(transformer.id)
  end

  def self.regulating_pt(transformer)
    RegulatingPt.most_recent(transformer)
  end

  def self.ngr(transformer)
    Ngr.most_recent(transformer)
  end

  def self.hot_line_oil_filter(transformer)
    HotLineOilFilter.most_recent(transformer)
  end

  def self.thermo_scan(transformer)
    ThermoScan.most_recent(transformer)
  end

  def self.visual_inspection(transformer)
    VisualInspection.where(transformer_id: transformer.id).order("test_date DESC").first
  end

  def self.oil_dga(transformer)
    OilDga.where(transformer_id: transformer.id).order("test_date DESC").first
  end

  def self.oil_quality_hi_factor(insulating_oil, oil_contamination)
    OilQuality.new.hi_factor(insulating_oil, oil_contamination, :oil_quality)
  end

  def self.furan_hi_factor(transformer)
    FuranFactor.hi_factor(transformer.id)
  end

  def self.oltc_dga_hi_factor(transformer)
    OltcDgaFactor.hi_factor(transformer.id)
  end

  def self.oltc_oil_quality_hi_factor(insulating_oil, oltc_oil_contamination)
    OltcOilQuality.new.hi_factor(insulating_oil, oltc_oil_contamination, :oltc_oil_quality)
  end

  def self.percent_hi_others(transformer)
    others_k = {:dga => 10, :load_history => 10, :power_factor => 10, :thermo_scan => 10, :oil_quality => 8, 
                :furan => 6, :general_condition => 1, :bushing_condition => 5, :surge_arrester => 3,
                :conservator_tank => 1, :main_tank => 1, :hot_line_oil_filter => 1, :radiator_cooling_system => 2,
                :transformer_control_cabinet => 1, :ngr => 1, :regulating_pt => 1}
    numerator = denominator = 0
    unless oil_dga(transformer).blank?
      numerator += (oil_dga(transformer).hi_factor * others_k[:dga])
      denominator += (HifOfOilDga.order("hi_factor DESC").first.hi_factor * others_k[:dga])
    end
    visual_inspection = visual_inspection(transformer)
    unless visual_inspection.blank?
      numerator += (visual_inspection.general_condition.load_history_hi_factor * others_k[:load_history])
      denominator += (LoadHistoryFactor.order("hi_factor DESC").first.hi_factor * others_k[:load_history])
    end
    unless power_factor_hi_factor(transformer).blank?
      numerator += (power_factor_hi_factor(transformer) * others_k[:power_factor])
      denominator += (PowerFactor.order("hi_factor DESC").first.hi_factor * others_k[:power_factor])
    end
    unless thermo_scan(transformer).blank?
      numerator += (thermo_scan(transformer).hi_factor * others_k[:thermo_scan])
      denominator += (ThermoScanFactor.order("hi_factor DESC").first.hi_factor * others_k[:thermo_scan])
    end
    unless oil_quality_hi_factor(insulating_oil(transformer), oil_contamination(transformer)).blank?
      numerator += (oil_quality_hi_factor(insulating_oil(transformer), oil_contamination(transformer)) * others_k[:oil_quality])
      denominator += (OilQualityFactor.order("hi_factor DESC").first.hi_factor * others_k[:oil_quality])
    end
    unless furan_hi_factor(transformer).blank?
      numerator += (furan_hi_factor(transformer) * others_k[:furan])
      denominator += (FuranFactor.order("hi_factor DESC").first.hi_factor * others_k[:furan])
    end
    unless visual_inspection.blank?
      numerator += (visual_inspection.general_condition.hi_factor * others_k[:general_condition])
      denominator += (GeneralConditionFactor.order("hi_factor DESC").first.hi_factor * others_k[:general_condition])
    end
    unless visual_inspection.blank?
      numerator += (visual_inspection.bushing_condition.hi_factor * others_k[:bushing_condition])
      denominator += (BushingConditionFactor.order("hi_factor DESC").first.hi_factor * others_k[:bushing_condition])
    end
    unless visual_inspection.blank?
      numerator += (visual_inspection.surge_arrester.hi_factor * others_k[:surge_arrester])
      denominator += (SurgeArresterFactor.order("hi_factor DESC").first.hi_factor * others_k[:surge_arrester])
    end
    unless visual_inspection.blank?
      numerator += (visual_inspection.conservator_tank.hi_factor * others_k[:conservator_tank])
      denominator += (ConservatorTankFactor.order("hi_factor DESC").first.hi_factor * others_k[:conservator_tank])
    end
    unless visual_inspection.blank?
      numerator += (visual_inspection.main_tank.hi_factor * others_k[:main_tank])
      denominator += (MainTankFactor.order("hi_factor DESC").first.hi_factor * others_k[:main_tank])
    end
    unless visual_inspection.blank?
      numerator += (visual_inspection.hot_line_oil_filter.hi_factor * others_k[:hot_line_oil_filter])
      denominator += (HotLineOilFilterFactor.order("hi_factor DESC").first.hi_factor * others_k[:hot_line_oil_filter])
    end
    unless visual_inspection.blank?
      numerator += (visual_inspection.radiator_cooling_system.hi_factor * others_k[:radiator_cooling_system])
      denominator += (RadiatorCoolingSystemFactor.order("hi_factor DESC").first.hi_factor * 
                      others_k[:radiator_cooling_system])
    end
    unless visual_inspection.blank?
      numerator += (visual_inspection.transformer_control_cabinet.hi_factor * others_k[:transformer_control_cabinet])
      denominator += (TransformerControlCabinetFactor.order("hi_factor DESC").first.hi_factor *
                      others_k[:transformer_control_cabinet])
    end
    unless visual_inspection.blank?
      numerator += (visual_inspection.ngr.hi_factor * others_k[:ngr])
      denominator += (NgrFactor.order("hi_factor DESC").first.hi_factor * others_k[:ngr])
    end
    unless visual_inspection.blank?
      numerator += (visual_inspection.regulating_pt.hi_factor * others_k[:regulating_pt])
      denominator += (RegulatingPtFactor.order("hi_factor DESC").first.hi_factor * others_k[:regulating_pt])
    end
    return nil if numerator == 0 && denominator == 0
    overall_condition = (numerator.to_f * 100.0) / denominator.to_f
  end

  def self.percent_hi_oltc(transformer)
    others_oltc = {:oltc_compartment => 1, :oltc_control_cabinet => 1, :dga_of_oltc => 6, :oltc_oil_quality => 3}
    numerator = denominator = 0
    visual_inspection = visual_inspection(transformer)
    unless visual_inspection.blank?
      numerator += (visual_inspection.oltc_compartment.hi_factor * others_oltc[:oltc_compartment])
      denominator += (OltcCompartmentFactor.order("hi_factor DESC").first.hi_factor * others_oltc[:oltc_compartment])
    end
    unless visual_inspection.blank?
      numerator += (visual_inspection.oltc_control_cabinet.hi_factor * others_oltc[:oltc_control_cabinet])
      denominator += (OltcControlCabinetFactor.order("hi_factor DESC").first.hi_factor * 
                      others_oltc[:oltc_control_cabinet])
    end
    unless oltc_dga_hi_factor(transformer).blank?
      numerator += (oltc_dga_hi_factor(transformer) * others_oltc[:dga_of_oltc])
      denominator += (OltcDgaFactor.order("hi_factor DESC").first.hi_factor * others_oltc[:dga_of_oltc])
    end
    unless oltc_oil_quality_hi_factor(insulating_oil(transformer), oltc_oil_contamination(transformer)).blank?
      numerator += (oltc_oil_quality_hi_factor(insulating_oil(transformer), oltc_oil_contamination(transformer)) * others_oltc[:oltc_oil_quality])
      denominator += (OltcOilQualityFactor.order("hi_factor DESC").first.hi_factor * others_oltc[:oltc_oil_quality])
    end
    return nil if numerator == 0 && denominator == 0
    (numerator.to_f * 100.0) / denominator.to_f
  end

  def self.percent_overall_health_index(transformer)
    unless Rails.cache.fetch("overall_condition.#{transformer.id}").nil?
      return Rails.cache.fetch("overall_condition.#{transformer.id}")
    end
    return nil if percent_hi_others(transformer) == nil && percent_hi_oltc(transformer) == nil
    overall_condition = (percent_hi_others(transformer) * 
                         OverallConditionWeight.where(:name => "others").first.weight.to_f / 100) +
                         (percent_hi_oltc(transformer) * 
                          OverallConditionWeight.where(:name => "oltc").first.weight.to_f / 100)
    Rails.cache.write("overall_condition.#{transformer.id}", overall_condition)
    return overall_condition
  end
end
