var Arrester = {};  

Arrester.leakageCurrent = {};
Arrester.leakageCurrent.h1 = null;
Arrester.leakageCurrent.h2 = null;
Arrester.leakageCurrent.h3 = null;

Arrester.wattLoss = {};
Arrester.wattLoss.h1 = null;
Arrester.wattLoss.h2 = null;
Arrester.wattLoss.h3 = null;

Arrester.insulationResistance = {};
Arrester.insulationResistance.h1 = null;
Arrester.insulationResistance.h2 = null;
Arrester.insulationResistance.h3 = null;

Arrester.setupTransformerNameComboxBox = function(id) {
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

    converted.on('select', function() { Arrester.onTransformerNamChange(converted.getValue()); });
  }
};


Arrester.plotLeakageCurrent = function(arresters, phase, markings, graphId) {
  var points = { };
  points.h1 = [];
  points.h2 = [];
  points.h3 = [];
  for (var i = 0; i < arresters.length; ++i) {
    points.h1.push([arresters[i].test_date_for_floth, arresters[i][phase +"1_percent_leakage_current"]]);
    points.h2.push([arresters[i].test_date_for_floth, arresters[i][phase + "2_percent_leakage_current"]]);
    points.h3.push([arresters[i].test_date_for_floth, arresters[i][phase + "3_percent_leakage_current"]]);
  }
  Arrester.leakageCurrent.h1 = points.h1;
  Arrester.leakageCurrent.h2 = points.h2;
  Arrester.leakageCurrent.h3 = points.h3;
  Arrester.plotGraph(points, markings, graphId, '%Leakage Current');
};

Arrester.plotWattLoss = function(arresters, phase, markings, graphId) {
  var points = { };
  points.h1 = [];
  points.h2 = [];
  points.h3 = [];
  for (var i = 0; i < arresters.length; ++i) {
    points.h1.push([arresters[i].test_date_for_floth, arresters[i][phase + "1_percent_watt_loss"]]);
    points.h2.push([arresters[i].test_date_for_floth, arresters[i][phase + "2_percent_watt_loss"]]);
    points.h3.push([arresters[i].test_date_for_floth, arresters[i][phase + "1_percent_watt_loss"]]);
  }
  Arrester.wattLoss.h1 = points.h1;
  Arrester.wattLoss.h2 = points.h2;
  Arrester.wattLoss.h3 = points.h3;
  Arrester.plotGraph(points, markings, graphId, '%Watt Loss');
};

Arrester.plotInsulationResistance = function(arresters, phase, markings, graphId) {
  var points = { };
  points.h1 = [];
  points.h2 = [];
  points.h3 = [];
  for (var i = 0; i < arresters.length; ++i) {
    points.h1.push([arresters[i].test_date_for_floth, arresters[i][phase + "1_percent_insulation_resistance"]]);
    points.h2.push([arresters[i].test_date_for_floth, arresters[i][phase + "2_percent_insulation_resistance"]]);
    points.h3.push([arresters[i].test_date_for_floth, arresters[i][phase + "3_percent_insulation_resistance"]]);
  }
  Arrester.insulationResistance.h1 = points.h1;
  Arrester.insulationResistance.h2 = points.h2;
  Arrester.insulationResistance.h3 = points.h3;
  Arrester.plotGraph(points, markings, graphId, '%Insulation Resistance');
};

Arrester.plotGraph = function (points, markings, graphId, yAxisLabel) {
  var placeholder = $(graphId);
  var options = {
    series: {lines: { show: true }, points: { show: true}},
    xaxis: {mode: "time", timeformat: "%d/%m/%y", axisLabel: 'วันทดสอบ'},
    yaxis: {
      axisLabel: yAxisLabel,
      axisLabelUseCanvas: false
      // min: 0, max: 100, ticks: [0, 40, 60, 100]
    },
    grid: {
      hoverable: true,
      clickable: true,
      markings: markings
    },
    selection: { mode: "xy" }
  };

  var data = [
  { label: 'H1', data: points.h1},
  { label: 'H2', data: points.h2},
  { label: 'H3', data: points.h3},
  ];
  var plot = $.plot(placeholder, data, options);
  // $(graphId).bind("plotselected", function (event, ranges) {
  //   // clamp the zooming to prevent eternal zoom
  //   if (ranges.xaxis.to - ranges.xaxis.from < 0.00001) {
  //     ranges.xaxis.to = ranges.xaxis.from + 0.00001;
  //   }
  //   if (ranges.yaxis.to - ranges.yaxis.from < 0.00001) {
  //     ranges.yaxis.to = ranges.yaxis.from + 0.00001;
  //   }
  //   // do the zooming
  //   plot = $.plot($(graphId), Arrester.getData(ranges.xaxis.from, ranges.xaxis.to, graphId),
  //                 $.extend(true, {}, options, {
  //                   xaxis: { min: ranges.xaxis.from, max: ranges.xaxis.to },
  //                   yaxis: { min: ranges.yaxis.from, max: ranges.yaxis.to }
  //                 }));
  // });
};

Arrester.loadAndPlot = function(testing, phase, graphId) {
  var url = $.url.attr('path').split("arresters");
  url = url[0] + "arrester_conditions?testing=" + testing;
  $.getJSON(url, function(data) {
    var i;
    var markings = [];
    for (i = 0; i < data.length; ++i) {
      if (data[i].end === null) {
        data[i].end = Number.MAX_VALUE;
      }
      markings.push({yaxis: {from: Number(data[i].start), to: Number(data[i].end)}, 
                     color: 'rgb(' + data[i].color.value + ')'});
    }
    $.getJSON($.url.attr('path'), function (data) {
       var arresters = data;
       if (testing == 'leakage_current') { Arrester.plotLeakageCurrent(arresters, phase, markings, graphId); }
       if (testing == 'watt_loss') { Arrester.plotWattLoss(arresters, phase, markings, graphId); }
       if (testing == 'insulation_resistance') { Arrester.plotInsulationResistance(arresters, phase, markings, graphId); }
    });
  });
};


Arrester.onTransformerNamChange = function(transformerId) {
  if ($('body').attr('name') == "new") {
    window.location.href = "/transformers/" + transformerId + "/arresters/new";
  } else {
    window.location.href = "/transformers/" + transformerId +  "/arresters";
  }
};

Arrester.setupDatePicker = function(id) {
  $(id).datepicker({dateFormat: 'dd/mm/yy', buttonImage: "images/icon_calendar.gif"});
};


$(function() {
  if ($('#arrester_test_date').length > 0) {
    Arrester.setupDatePicker('#arrester_test_date');
  }

  Arrester.setupTransformerNameComboxBox('arrester_transformer_id');
  
  if ($("#hv_leakage_current_graph").length > 0) {
    Arrester.loadAndPlot('leakage_current', 'h', "#hv_leakage_current_graph");
    $("#hv_leakage_current_reset").click(function () {
      Arrester.loadAndPlot('leakage_current', 'h', "#hv_leakage_current_graph");
    });
  }

  if ($("#hv_watt_loss_graph").length > 0) {
    Arrester.loadAndPlot('watt_loss', 'h', "#hv_watt_loss_graph");
    $("#hv_watt_loss_reset").click(function () {
      Arrester.loadAndPlot('watt_loss', 'h', "#hv_watt_loss_graph");
    });
  }
  
  if ($("#hv_insulation_resistance_graph").length > 0) {
    Arrester.loadAndPlot('insulation_resistance', 'h', "#hv_insulation_resistance_graph");
    $("#hv_insulation_resistance_reset").click(function () {
      Arrester.loadAndPlot('insulation_resitance', 'h', "#hv_insulation_resistance_graph");
    });
  }

  if ($("#xv_leakage_current_graph").length > 0) {
    Arrester.loadAndPlot('leakage_current', 'x', "#xv_leakage_current_graph");
    $("#xv_leakage_current_reset").click(function () {
      Arrester.loadAndPlot('leakage_current', 'x', "#xv_leakage_current_graph");
    });
  }
  
  if ($("#xv_watt_loss_graph").length > 0) {
    Arrester.loadAndPlot('watt_loss', 'x', "#xv_watt_loss_graph");
    $("#xv_watt_loss_reset").click(function () {
      Arrester.loadAndPlot('watt_loss', 'x', "#xv_watt_loss_graph");
    });
  }
  
  if ($("#xv_insulation_resistance_graph").length > 0) {
    Arrester.loadAndPlot('insulation_resistance', 'x', "#xv_insulation_resistance_graph");
    $("#xv_insulation_resistance_reset").click(function () {
      Arrester.loadAndPlot('insulation_resitance', 'x', "#xv_insulation_resistance_graph");
    });
  }

  if ($("#yv_leakage_current_graph").length > 0) {
    Arrester.loadAndPlot('leakage_current', 'y', "#yv_leakage_current_graph");
    $("#yv_leakage_current_reset").click(function () {
      Arrester.loadAndPlot('leakage_current', 'y', "#yv_leakage_current_graph");
    });
  }
  
  if ($("#yv_watt_loss_graph").length > 0) {
    Arrester.loadAndPlot('watt_loss', 'y', "#yv_watt_loss_graph");
    $("#yv_watt_loss_reset").click(function () {
      Arrester.loadAndPlot('watt_loss', 'y', "#yv_watt_loss_graph");
    });
  }
  
  if ($("#yv_insulation_resistance_graph").length > 0) {
    Arrester.loadAndPlot('insulation_resistance', 'y', "#yv_insulation_resistance_graph");
    $("#yv_insulation_resistance_reset").click(function () {
      Arrester.loadAndPlot('insulation_resitance', 'y', "#yv_insulation_resistance_graph");
    });
  }
  
  
  
});
