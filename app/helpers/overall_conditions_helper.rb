module OverallConditionsHelper

  def hi_factor(object)
    unless object.blank?
      object.hi_factor
    else
      " - "
    end
  end

  def bushing_test(type, phase)
    min = [@bushing_test.health_index_factor(phase + "1"), @bushing_test.health_index_factor(phase + "2"), 
           @bushing_test.health_index_factor(phase + "3")].min
    case type
    when :hi_factor
      return min
    when :color
      link_to(color_span(BushingTestFactor.where(:hi_factor => min).first.color.value).html_safe, 
              transformer_bushing_tests_path)
    end
  end  
  def arrester(type, phase)
    min = [@arrester.health_index_factor(phase + "1"), @arrester.health_index_factor(phase + "2"), 
           @arrester.health_index_factor(phase + "3")].min
    case type
    when :hi_factor
      return min
    when :color
      link_to(color_span(ArresterFactor.where(:hi_factor => min).first.color.value).html_safe, transformer_arresters_path)
    end
  end

  def insulating_oil(type)
    unless @insulating_oil.blank? && @oltc_oil_contamination.blank?
      case type
      when :color
        return color_span(InsulatingOilFactor.color(@insulating_oil, @oil_contamination)).html_safe
      when :percent_hi
        return number_with_precision(InsulatingOilFactor.percent_hi(@insulating_oil, @oil_contamination), :precision => 2)
      end
    else
      " - "
    end
  end

  def oltc_oil_quality(type)
    unless @insulating_oil.blank? && @oltc_oil_contamination.blank?
      oltc_oil_quality = OltcOilQuality.new
      case type
      when :hi_factor
        return oltc_oil_quality.hi_factor(@insulating_oil, @oltc_oil_contamination, :oltc_oil_quality)
      when :color
        return link_to(color_span(oltc_oil_quality.hi_factor_color(@insulating_oil, @oltc_oil_contamination, :oltc_oil_quality)).html_safe,
                       transformer_oltc_oil_qualities_path(@transformer))
      when :test_date
        return oltc_oil_quality.test_date(@insulating_oil, @oltc_oil_contamination)
      end
    else
      " - "
    end
  end

  def oltc_oil_contamination(type)
    unless @insulating_oil.blank? && @oltc_oil_contamination.blank?
      oltc_oil_quality = OltcOilQuality.new
      case type
      when :hi_factor
        return oltc_oil_quality.hi_factor(@insulating_oil, @oltc_oil_contamination, :oltc_oil_contamination)
      when :color
        return link_to(color_span(oltc_oil_quality.hi_factor_color(@insulating_oil, @oltc_oil_contamination, :oltc_oil_contamination)).html_safe,
                       :controller => 'oltc_oil_qualities', :action => 'oltc_oil_contaminations', :transformer_id => @transformer.id)
      when :test_date
        return oltc_oil_quality.test_date(@insulating_oil, @oltc_oil_contamination)
      end
    else
      " - "
    end
  end

  def oltc_dielectric_property(type)
    unless @insulating_oil.blank? && @oltc_oil_contamination.blank?
      oltc_oil_quality = OltcOilQuality.new
      case type
      when :hi_factor
        return oltc_oil_quality.hi_factor(@insulating_oil, @oltc_oil_contamination, :oltc_dielectric_property)
      when :color
        return link_to(color_span(oltc_oil_quality.hi_factor_color(@insulating_oil, @oltc_oil_contamination, :oltc_dielectric_property)).html_safe,
                       :controller => 'oltc_oil_qualities', :action => 'oltc_dielectric_properties',
                       :transformer_id => @transformer.id)
      when :test_date
        return oltc_oil_quality.test_date(@insulating_oil, @oltc_oil_contamination)
      end
    else
      " - "
    end
  end

  def oil_contamination(type)
    unless @insulating_oil.blank? && @oil_contamination.blank?
      oil_quality = OilQuality.new
      case type
      when :hi_factor
        return oil_quality.hi_factor(@insulating_oil, @oil_contamination, :contamination)
      when :color
        return link_to(color_span(oil_quality.hi_factor_color(@insulating_oil, @oil_contamination, :contamination)).html_safe,
                       :controller => "oil_qualities", :action => "oil_contaminations", :transformer_id => @transformer.id)
      when :test_date
        return oil_quality.test_date(@insulating_oil, @oil_contamination)
      end
    else
      " - "
    end
  end

  def oil_quality(type)
    unless @insulating_oil.blank? && @oil_contamination.blank?
      oil_quality = OilQuality.new
      case type
      when :hi_factor
        return oil_quality.hi_factor(@insulating_oil, @oil_contamination, :oil_quality)
      when :color
        return link_to(color_span(oil_quality.hi_factor_color(@insulating_oil,
                                                              @oil_contamination, :oil_quality)).html_safe,
                       transformer_oil_qualities_path(@transformer))
      when :test_date
        return oil_quality.test_date(@insulating_oil, @oil_contamination)
      end
    else
      " - "
    end
  end

  def aging_product(type)
    unless @oil_contamination.blank?
      aging_product = AgingProduct.new
      case type
      when :hi_factor
        return aging_product.hi_factor(@oil_contamination)
      when :color
        return link_to(color_span(aging_product.hi_factor_color(@oil_contamination)).html_safe,
                       transformer_aging_products_path(@transformer))
      when :test_date
        return aging_product.test_date(@oil_contamination)
      end
    else
      " - "
    end
  end

  def furan_hi_factor
    unless FuranFactor.hi_factor(@transformer.id).blank?
      FuranFactor.hi_factor(@transformer.id)
    else
      " - "
    end
  end

  def furan_factor_color
    unless FuranFactor.hi_factor(@transformer.id).blank?
      link = transformer_furans_path(@transformer)
      return link_to(color_span(FuranFactor.color(@transformer.id)).html_safe, link)
    else
      " - "
    end
  end

  def furan_factor_test_date
    unless FuranFactor.test_date(@transformer.id).blank?
      FuranFactor.test_date(@transformer.id)
    else
      " - "
    end
  end

  def oltc_dga(type)
    case type
    when :hi_factor
      unless OltcDgaFactor.hi_factor(@transformer.id).blank?
        OltcDgaFactor.hi_factor(@transformer.id)
      else
        " - "
      end
    when :color
      unless OltcDgaFactor.hi_factor(@transformer.id).blank?
        link = transformer_oltc_dgas_path(@transformer)
        return link_to(color_span(OltcDgaFactor.color(@transformer.id)).html_safe, link)
      else
        " - "
      end
    when :test_date
      unless OltcDgaFactor.test_date(@transformer.id).blank?
        OltcDgaFactor.test_date(@transformer.id)
      else
        " - "
      end
    end
  end

  def power_factor_hi_factor
    unless PowerFactor.hi_factor(@transformer.id).blank?
      PowerFactor.hi_factor(@transformer.id)
    else
      " - "
    end
  end

  def power_factor_color
    unless PowerFactor.hi_factor(@transformer.id).blank?
      link = transformer_power_factors_path(@transformer)
      return link_to(color_span(PowerFactor.color(@transformer.id)).html_safe, link)
    else
      " - "
    end
  end

  def power_factor_test_date
    unless PowerFactor.test_date(@transformer.id).blank?
      PowerFactor.test_date(@transformer.id)
    else
      " - "
    end
  end

  def load_history_hi_factor
    unless @visual_inspection.blank?
      @visual_inspection.general_condition.load_history_hi_factor
    else
      " - "
    end
  end

  def general_condition_factor_color(visual_inspection, transformer)
    unless visual_inspection.general_condition.nil?
      general_condition_factor = GeneralConditionFactor.where("hi_factor = ?",
                                                              visual_inspection.general_condition.hi_factor).first
      link = transformer_visual_inspection_general_conditions_path(transformer, visual_inspection)
      return link_to(color_span(general_condition_factor.color).html_safe, link)
    end
  end

  def load_history_factor_color
    unless @visual_inspection.blank?
      load_history_factor =
        LoadHistoryFactor.where("hi_factor = ?", @visual_inspection.general_condition.load_history_hi_factor).first
      link = transformer_visual_inspection_load_histories_path(@transformer, @visual_inspection)
      return link_to(color_span(load_history_factor.color).html_safe, link)
    else
      " - "
    end
  end

  def bushing_condition_factor_color(visual_inspection, transformer)
    unless visual_inspection.bushing_condition.nil?
      bushing_condition_factor = BushingConditionFactor.where("hi_factor = ?",
                                                              visual_inspection.bushing_condition.hi_factor).first
      link = transformer_visual_inspection_bushing_conditions_path(transformer, visual_inspection)
      return link_to(color_span(bushing_condition_factor.color).html_safe, link)
    end
  end

  def surge_arrester_factor_color(visual_inspection, transformer)
    unless visual_inspection.surge_arrester.blank?
      surge_arrester_factor = SurgeArresterFactor.where("hi_factor = ?",
                                                        visual_inspection.surge_arrester.hi_factor).first
      link = transformer_visual_inspection_surge_arresters_path(transformer, visual_inspection)
      return link_to(color_span(surge_arrester_factor.color).html_safe, link)
    end
  end

  def conservator_tank_factor_color(visual_inspection, transformer)
    unless visual_inspection.conservator_tank.blank?
      conservator_tank_factor = ConservatorTankFactor.where("hi_factor = ?",
                                                            visual_inspection.conservator_tank.hi_factor).first
      link = transformer_visual_inspection_conservator_tanks_path(transformer, visual_inspection)
      return link_to(color_span(conservator_tank_factor.color).html_safe, link)
    end
  end

  def main_tank_factor_color(visual_inspection, transformer)
    unless visual_inspection.main_tank.nil?
      main_tank_factor = MainTankFactor.where("hi_factor = ?", visual_inspection.main_tank.hi_factor).first
      link = transformer_visual_inspection_main_tanks_path(transformer, visual_inspection)
      return link_to(color_span(main_tank_factor.color).html_safe, link)
    end
  end

  def hot_line_oil_filter_factor_color
    unless @hot_line_oil_filter.blank?
      hot_line_oil_filter_factor = HotLineOilFilterFactor.where("hi_factor = ?", @hot_line_oil_filter.hi_factor).first
      link = transformer_visual_inspection_hot_line_oil_filters_path(
      @transformer, @hot_line_oil_filter.visual_inspection)
      return link_to(color_span(hot_line_oil_filter_factor.color).html_safe, link)
    else
      " - "
    end
  end

  def radiator_cooling_system_factor_color(visual_inspection, transformer)
    unless visual_inspection.radiator_cooling_system.nil?
      radiator_cooling_system_factor =
        RadiatorCoolingSystemFactor.where("hi_factor = ?",
                                          visual_inspection.
                                          radiator_cooling_system.
                                          hi_factor).first
      link = transformer_visual_inspection_radiator_cooling_systems_path(transformer, visual_inspection)
      return link_to(color_span(radiator_cooling_system_factor.color).html_safe, link)
    end
  end

  def transformer_control_cabinet_factor_color(visual_inspection, transformer)
    unless visual_inspection.transformer_control_cabinet.blank?
      transformer_control_cabinet_factor =
        TransformerControlCabinetFactor.where("hi_factor = ?",
                                              visual_inspection.transformer_control_cabinet.hi_factor).first
      link = transformer_visual_inspection_transformer_control_cabinets_path(transformer, visual_inspection)
      return link_to(color_span(transformer_control_cabinet_factor.color).html_safe, link)
    end
  end

  def ngr_factor_color(ngr, transformer)
    unless ngr.blank?
      ngr_factor = NgrFactor.where("hi_factor = ?", ngr.hi_factor).first
      link = transformer_visual_inspection_ngrs_path(transformer, ngr.visual_inspection)
      return link_to(color_span(ngr_factor.color).html_safe, link)
    else
      " - "
    end
  end

  def regulating_pt_factor_color
    unless @regulating_pt.blank?
      regulating_pt_factor = RegulatingPtFactor.where("hi_factor = ?", @regulating_pt.hi_factor).first
      link = transformer_visual_inspection_regulating_pts_path(@transformer, @regulating_pt.visual_inspection)
      return link_to(color_span(regulating_pt_factor.color).html_safe, link)
    else
      " - "
    end
  end

  def oltc_compartment_factor_color(visual_inspection, transformer)
    unless visual_inspection.oltc_compartment.blank?
      oltc_compartment_factor = OltcCompartmentFactor.where("hi_factor = ?",
                                                            visual_inspection.oltc_compartment.hi_factor).first
      link = transformer_visual_inspection_oltc_compartments_path(transformer, visual_inspection)
      return link_to(color_span(oltc_compartment_factor.color).html_safe, link)
    end
  end

  def oltc_control_cabinet_factor_color(visual_inspection, transformer)
    unless visual_inspection.oltc_control_cabinet.blank?
      oltc_control_cabinet_factor =
        OltcControlCabinetFactor.where("hi_factor = ?", visual_inspection.oltc_control_cabinet.hi_factor).first
      link = transformer_visual_inspection_oltc_control_cabinets_path(transformer, visual_inspection)
      return link_to(color_span(oltc_control_cabinet_factor.color).html_safe, link)
    end
  end

  def thermo_scan_factor_color(thermo_scan, transformer)
    unless thermo_scan.blank?
      thermo_scan_factor = ThermoScanFactor.where("hi_factor = ?", thermo_scan.hi_factor).first
      link = transformer_visual_inspection_thermo_scans_path(
      transformer, thermo_scan.visual_inspection)
      return link_to(color_span(thermo_scan_factor.color).html_safe, link)
    else
      " - "
    end
  end

  def recent_date(visual_inspection)
    unless visual_inspection.blank?
      visual_inspection.test_date.strftime("%d/%m/%Y")
    else
      " - "
    end
  end

  def oil_dga_test_date
    @oil_dgas.first.test_date.strftime("%d/%m/%Y")
  end

  def oil_dga_factor_color
    oil_dga_factor = HifOfOilDga.where("hi_factor = ?", @oil_dgas.first.hi_factor).first
    link = graph_transformer_oil_dgas_path(@transformer)
    return link_to(color_span(oil_dga_factor.color).html_safe, link)
  end

  def color_span(value)
    "<span style=\"padding:0px 40px 0px 40px; background:rgb(" + "#{value});\">&nbsp;</span>"
  end

end
