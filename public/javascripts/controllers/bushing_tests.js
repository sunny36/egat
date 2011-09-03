var BushingTest = {};

BushingTest.setupTransformerNameComboxBox = function(id) {
  if ($('#' + id).length > 0) {
    var transformerId;
    var selected;
    if (jQuery.url.attr("path").split("/")[1] == "transformers" && 
    Number(jQuery.url.attr("path").split("/")[2]) > 0) {
      transformerId = Number(jQuery.url.attr("path").split("/")[2]);
    }
    selected = $("#" + id + " " + "option:selected");
    if (selected.val().length > 0) {
      transformerId = selected.val();
    }
    var converted = new Ext.form.ComboBox({
      typeAhead: true,
      triggerAction: 'all',
      transform: id, 
      width: '200',
      forceSelection:true,
      value: transformerId
    });

    converted.on('select', function() { BushingTest.onTransformerNamChange(converted.getValue()); });
  }
};

BushingTest.onTransformerNamChange = function(transformerId) {
  if ($('body').attr('name') == "new") {
    window.location.href = "/transformers/" + transformerId + "/bushing_tests/new";
  } else {
    window.location.href = "/transformers/" + transformerId +  "/bushing_tests";
  }
};

BushingTest.setupDatePicker = function(id) {
  $(id).datepicker({dateFormat: 'dd/mm/yy', buttonImage: "images/icon_calendar.gif"});	  
};

BushingTest.computePowerFactor = function() {
  $('.test-kv, .current, .watt').blur(function() {
    var prefix = $(this).attr("id");
    prefix = prefix.split("_");
    prefix = prefix[0] + "_" + prefix[1] + "_" + prefix[2] + "_" + prefix[3];
    var watt = parseInt($("#" + prefix + "_" + "watt").val(), 10);
    var current = parseInt($("#" + prefix + "_" + "current").val(), 10);
    var testKv = parseInt($("#" + prefix + "_" + "test_kv").val(), 10);
    var cf = parseInt($("#bushing_test_cf").val(), 10);
    if (!isNaN(watt) && !isNaN(current) && !isNaN(testKv)) {
      var percentPowerFactorAverage = (watt * 100) / (current * testKv);
      $("#" + prefix + "_" + "percent_power_factor_avg").val(percentPowerFactorAverage);
      if(!isNaN(cf)) {
        var percentPowerFactorCor20C = percentPowerFactorAverage * cf;
        $("#" + prefix + "_" + "percent_power_factor_cor").val(percentPowerFactorCor20C);
      }
    }
  });
};

$(function() {
  if ($('#bushing_test_test_date').length > 0) {
    BushingTest.setupDatePicker('#bushing_test_test_date');
  }
	
  BushingTest.setupTransformerNameComboxBox('bushing_test_transformer_id');

  BushingTest.computePowerFactor();
});
