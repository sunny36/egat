InsulatingOil = {};

InsulatingOil.setDefaultValues = function () {
  // TODO Get the value 10 from the server
  $("#insulating_oil_test_kv_maintank").val("10");
  $("#insulating_oil_test_kv_oltc").val("10");
  $("#insulating_oil_cf").val("1");
};

InsulatingOil.disableReadOnlyFields = function () {
  var fields = ["xi1", "xi2", "xi3", "xi4", "xi5"];
  var type = ["maintank", "oltc"];
  var i, j;
  for (i = 0; i < type.length; ++i) {
    for (j = 0; j < fields.length; ++j) {
      $("#insulating_oil_" + fields[j] + "_" + type[i] + 
        "_minus_xbar_whole_squared").attr("disabled", true);
    }
  }
  $("#insulating_oil_xi_sum_maintank, #insulating_oil_xi_sum_oltc").attr("disabled", true);
  $("#insulating_oil_xi_average_maintank, #insulating_oil_xi_average_oltc").attr("disabled", true);
  $('#insulating_oil_sum_xi_minus_xbar_whole_squared_maintank, ' + 
    '#insulating_oil_sum_xi_minus_xbar_whole_squared_oltc').attr("disabled", true);
  $('#insulating_oil_s_maintank, #insulating_oil_s_oltc').attr("disabled", true);
  $('#insulating_oil_cv_maintank, #insulating_oil_cv_oltc').attr('disabled', true);
  $('#insulating_oil_avg_percent_power_factor_maintank, ' + 
    '#insulating_oil_cor_percent_power_factor_maintank, ' +
    '#insulating_oil_avg_percent_power_factor_oltc, ' + 
    '#insulating_oil_cor_percent_power_factor_oltc').attr("disabled", true);
};

InsulatingOil.setAveragePowerFactor = function (type) {
  var powerFactor = InsulatingOil.getAveragePowerFactor(type);
  if (powerFactor !== null) {
    $("#insulating_oil_avg_percent_power_factor_" + type).val(powerFactor.toFixed(4));
    InsulatingOil.setCorPowerFactor(type);	  
  }
};

InsulatingOil.getAveragePowerFactor = function (type) {
  var watt = parseFloat($("#insulating_oil_watt_avg_" + type).val());
  var current = parseFloat($("#insulating_oil_current_avg_" + type).val());
  var testKv = parseFloat($("#insulating_oil_test_kv_" + type).val());
  var averagePowerFactor;
  if (!isNaN(watt) && !isNaN(current) && !isNaN(testKv)) {
    averagePowerFactor = (watt * Math.pow(10, 5)) / (current * testKv);
    return averagePowerFactor;
  } else {
    return null;
  }
};

InsulatingOil.setCorPowerFactor = function (type) {
  var cf = parseFloat($("#insulating_oil_cf").val());
  var avg = InsulatingOil.getAveragePowerFactor(type);
  var cor; 
  if (!isNaN(cf) && avg !== null) {
    cor = avg * cf;
    $("#insulating_oil_cor_percent_power_factor_" + type).val(cor.toFixed(4));
  }
};


InsulatingOil.calculateDielectricBreakDownVoltageTest = function (type) {
  var xi = InsulatingOil.getXi(type);
  var anyNaN = false;
  for (var i = 0; i < xi.length; ++i) {
    if (isNaN(xi[i])) {
      anyNaN = true;
    }
  }
  if (!anyNaN) {
    $("#insulating_oil_xi_sum_" + type).val(InsulatingOil.sum(xi[0], xi[1], xi[2], xi[3], xi[4]));
    $("#insulating_oil_xi_average_" + type).val(InsulatingOil.average(xi[0], xi[1], xi[2], xi[3], xi[4]));
    InsulatingOil.displayXiMinuxXbarSquared(type);
    $("#insulating_oil_sum_xi_minus_xbar_whole_squared_" + type)
    .val(InsulatingOil.getSumXiMinusXbarSquared(type).toFixed(2));
    $("#insulating_oil_s_" + type).val(InsulatingOil.getS(type).toFixed(2));
    $("#insulating_oil_cv_" + type).val(InsulatingOil.getCV(type).toFixed(2));
  }
};

InsulatingOil.getS = function (type) {
  var sumXiMinusXbarSquared = InsulatingOil.getSumXiMinusXbarSquared(type);
  return Math.sqrt(sumXiMinusXbarSquared/4);
};

InsulatingOil.getSumXiMinusXbarSquared = function (type) {
  var xi_minus_xbar_squared = InsulatingOil.getXiMinuxXbarSquared(type);
  return InsulatingOil.sum(xi_minus_xbar_squared[0], xi_minus_xbar_squared[1], 
                           xi_minus_xbar_squared[2], xi_minus_xbar_squared[3], xi_minus_xbar_squared[4]);

};

InsulatingOil.sum= function (x1, x2, x3, x4, x5) {
  return x1 + x2 + x3 + x4 + x5;
};

InsulatingOil.average = function(x1, x2, x3, x4, x5) {
  return InsulatingOil.sum(x1, x2, x3, x4, x5) / 5;
};

InsulatingOil.getCV = function (type) {
  return (InsulatingOil.getS(type) / InsulatingOil.getXBar(type));
};

InsulatingOil.getXBar = function (type) {
  var xi = InsulatingOil.getXi(type);
  return InsulatingOil.average(xi[0], xi[1], xi[2], xi[3], xi[4]);
};

InsulatingOil.getXiMinuxXbarSquared = function (type) {
  var i;
  var xi = InsulatingOil.getXi(type);
  var xbar = InsulatingOil.average(xi[0], xi[1], xi[2], xi[3], xi[4]);
  var xi_minus_xbar_squared = [];
  for (i = 0; i < xi.length; ++i) {
    xi_minus_xbar_squared[i] = (xi[i] - xbar) * (xi[i] - xbar);
  }
  return xi_minus_xbar_squared;
};

InsulatingOil.displayXiMinuxXbarSquared = function (type) {
  var xi_minus_xbar_squared = InsulatingOil.getXiMinuxXbarSquared(type);
  var fields = ["xi1", "xi2", "xi3", "xi4", "xi5"];
  for (i = 0; i < fields.length; ++i) {
    fields[i] = "#insulating_oil_" + fields[i] + "_" + type + "_minus_xbar_whole_squared";
    $(fields[i]).val(xi_minus_xbar_squared[i].toFixed(2));
  }
};

InsulatingOil.getXi = function (type) {
  var fields = ["xi1", "xi2", "xi3", "xi4", "xi5"];
  for (var i = 0; i < fields.length; ++i) {
    fields[i] = "#insulating_oil_" + fields[i] + "_" + type;
  }
  x1 = parseFloat($(fields[0]).val());
  x2 = parseFloat($(fields[1]).val());
  x3 = parseFloat($(fields[2]).val());
  x4 = parseFloat($(fields[3]).val());
  x5 = parseFloat($(fields[4]).val());

  return [x1, x2, x3, x4, x5];
};

InsulatingOil.custom_confirm_ok = function(prompt, action) {
  var $dialog = $('<div></div>')
  .html(prompt)
  .dialog({
      autoOpen: false,
      title: 'Grecocos',
      modal: true,
      resizable: false,
      closeOnEscape: false,
      open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
      width: 'auto',
      buttons: {
        'OK': function() {
          $(this).dialog('close');
          action();
        }
      }
  });
  $dialog.dialog('open');
};   

InsulatingOil.setupDatePicker = function(id) {
  $(id).datepicker({dateFormat: 'dd/mm/yy', buttonImage: "images/icon_calendar.gif"});	  
};

InsulatingOil.setupTransformerNameComboxBox = function(id) {
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

    converted.on('select', function() {
      InsulatingOil.onTransformerNamChange(converted.getValue());    
    });
  }
};

InsulatingOil.onTransformerNamChange = function(transformerId) {
  if ($('body').attr('name') == "new") {
    window.location.href = "/transformers/" + transformerId + "/insulating_oils/new";
  } else {
    window.location.href = "/transformers/" + transformerId +  "/insulating_oils";
  }
};

$(function() {
    InsulatingOil.setDefaultValues();
    InsulatingOil.disableReadOnlyFields();

    $("#insulating_oil_xi1_maintank,#insulating_oil_xi2_maintank," + 
      "#insulating_oil_xi3_maintank,#insulating_oil_xi4_maintank," +
      "#insulating_oil_xi5_maintank").blur(function () {
        $field = $(this);
        if (!isNaN(Number($(this).val()))) {
          InsulatingOil.calculateDielectricBreakDownVoltageTest("maintank");
        } else {
          InsulatingOil.custom_confirm_ok("Please enter number only", 
            function () { 
              $field.val("");
              return; 
          });
        }
    });

    $("#insulating_oil_xi1_oltc, " + "#insulating_oil_xi2_oltc, " +
      "#insulating_oil_xi3_oltc, " + "#insulating_oil_xi4_oltc, " + 
      "#insulating_oil_xi5_oltc").blur(function () {
        $field = $(this);
        if (!isNaN(Number($field.val()))) {
          InsulatingOil.calculateDielectricBreakDownVoltageTest("oltc");
        } else {
          InsulatingOil.custom_confirm_ok("Please enter number only",
            function () { 
              $field.val(""); 
              return;
          });
        }
    });

    $("#insulating_oil_watt_avg_maintank, " +
      "#insulating_oil_current_avg_maintank, " + 
      "#insulating_oil_test_kv_maintank").blur(function () {
        $field = $(this);
        if (!isNaN(Number($field.val()))) {
          InsulatingOil.setAveragePowerFactor("maintank");
        } else {
          InsulatingOil.custom_confirm_ok("Please enter number only",
            function () { 
              $field.val(""); 
              return;
          });
        }
    });

    $("#insulating_oil_watt_avg_oltc, " +
      "#insulating_oil_current_avg_oltc, " + 
      "#insulating_oil_test_kv_oltc").blur(function () {
        $field = $(this);
        if (!isNaN(Number($field.val()))) {
          InsulatingOil.setAveragePowerFactor("oltc");
        } else {
          InsulatingOil.custom_confirm_ok("Please enter number only",
            function () {
              $field.val();
              return; 
            });
        }
    });

    $('#insulating_oil_cf').blur(function () {
        $field = $(this);
        if (!isNaN(Number($field.val()))) {
          InsulatingOil.setCorPowerFactor('maintank');
          InsulatingOil.setCorPowerFactor('oltc');
        } else {
          InsulatingOil.custom_confirm_ok("Please enter number only",
            function () {
              $field.val();
              return;
          });
        }
    });

		if ($('#insulating_oil_test_date').length > 0) {
	    InsulatingOil.setupDatePicker('#insulating_oil_test_date');
    }

    InsulatingOil.setupTransformerNameComboxBox('insulating_oil_transformer_id');
	  
});
