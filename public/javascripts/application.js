// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

$(document).ready(function() {
  $.get('/transformers', function(data) {
    var myObject = eval('(' + data + ')');

  });

  $("#transformer_information_transformer_name").autocomplete({
    source: "/transformers",
    minLength: 1,
    select: function(event, ui) {
      $(this).val(ui.item.value);
      return false;
    }
  });

  $('#transformer_information_bus_voltage_hv_id').change(function () {
    setSystemFaultLevelHvMva(); 
  });

  $('#transformer_information_system_fault_level_hv').blur(function () {
    setSystemFaultLevelHvMva(); 
  });

  function setSystemFaultLevelHvMva() {
    var busVoltageHv = parseFloat($('#transformer_information_bus_voltage_hv_id :selected').
                                  text()); 
    var systemFaultLevelHv = parseFloat($('#transformer_information_system_fault_level_hv').
                                        val());
    if (!isNaN(busVoltageHv) && !isNaN(systemFaultLevelHv)) {
      var systemFaultLevelHvMva = 1.732 * busVoltageHv * systemFaultLevelHv; 
      $('#transformer_information_system_fault_level_hv_mva').
        val(systemFaultLevelHvMva); 
    }
  }

  $('#transformer_information_bus_voltage_lv_id').change(function () {
    setSystemFaultLevelLvMva(); 
  });

  $('#transformer_information_system_fault_level_lv').blur(function () {
    setSystemFaultLevelLvMva(); 
  });

  function setSystemFaultLevelLvMva() {
    var busVoltageLv = parseFloat($('#transformer_information_bus_voltage_lv_id :selected').
                                  text()); 
    var systemFaultLevelLv = parseFloat($('#transformer_information_system_fault_level_lv').
                                        val());
    if (!isNaN(busVoltageLv) && !isNaN(systemFaultLevelLv)) {
      var systemFaultLevelLvMva = 1.732 * busVoltageLv * systemFaultLevelLv; 
      $('#transformer_information_system_fault_level_lv_mva').
        val(systemFaultLevelLvMva); 
    }
  }

  
    $("#transformer_information_recorded_date").datepicker({
  			showOn: 'both',
  			buttonImage: '/images/icon_calendar.gif',
  			buttonImageOnly: true,
  		});
});
