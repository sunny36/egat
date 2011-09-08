var BushingTest = {};

BushingTest.powerFactorCor20CPoints = {};
BushingTest.powerFactorAvgPoints = {};

BushingTest.getData = function (x1, x2, graphId) {
  var points = { };
  points.h1 = [];
  points.h2 = [];
  var dataPoints = {};
  if (graphId == '#power_factor_cor_20c_graph') {
    dataPoints.h1 = BushingTest.powerFactorCor20CPoints.h1;
    dataPoints.h2 = BushingTest.powerFactorCor20CPoints.h2;
  }
  for (var i = 0; i < dataPoints.h1.length; ++i) {
    if (dataPoints.h1[i][0] >= x1 && dataPoints.h1[i][0] <= x2) {
      points.h1.push([dataPoints.h1[i][0], dataPoints.h1[i][1]]);
    }
  }
  for (var i = 0; i < dataPoints.h2.length; ++i) {
    if (dataPoints.h2[i][0] >= x1 && dataPoints.h2[i][0] <= x2) {
      points.h2.push([dataPoints.h2[i][0], dataPoints.h2[i][1]]);
    }
  }  
  var data = [
  { label: 'H1', data: points.h1},
  { label: 'H2', data: points.h2}
  ];
  //return [{data: points.h1}];
  return data;
};

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

BushingTest.plotPowerFactorCor20C = function(bushingTests, phase, markings, graphId) {
  var points = { };
  points.h1 = [];
  points.h2 = [];
  points.h3 = [];
  points.h0 = [];
  for (var i = 0; i < bushingTests.length; ++i) {
    points.h1.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "1_c1_percent_power_factor_cor"]]);
    points.h2.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "2_c1_percent_power_factor_cor"]]);
    points.h3.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "3_c1_percent_power_factor_cor"]]);
    points.h0.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "0_c1_percent_power_factor_cor"]]);
  }
  BushingTest.plotGraph(points, markings, graphId, 'Power Factor');
};

BushingTest.plotPowerFactorAvg = function(bushingTests, phase, markings, graphId) {
  var points = { };
  points.h1 = [];
  points.h2 = [];
  points.h3 = [];
  points.h0 = [];
  for (var i = 0; i < bushingTests.length; ++i) {
    points.h1.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "1_c2_percent_power_factor_avg"]]);
    points.h2.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "2_c2_percent_power_factor_avg"]]);
    points.h3.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "3_c2_percent_power_factor_avg"]]);
    points.h0.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "0_c2_percent_power_factor_avg"]]);
  }
  BushingTest.plotGraph(points, markings, graphId, 'Power Factor');
};

BushingTest.plotCapacitance1 = function(bushingTests, phase, markings, graphId) {
  var points = { };
  points.h1 = [];
  points.h2 = [];
  points.h3 = [];
  points.h0 = [];
  for (var i = 0; i < bushingTests.length; ++i) {
    points.h1.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "1_c1_capacitance"]]);
    points.h2.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "2_c1_capacitance"]]);
    points.h3.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "3_c1_capacitance"]]);
    points.h0.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "0_c1_capacitance"]]);
  }
  BushingTest.plotGraph(points, markings, graphId, '%Capacitance (C1)');
};

BushingTest.plotCapacitance2 = function(bushingTests, phase, markings, graphId) {
  var points = { };
  points.h1 = [];
  points.h2 = [];
  points.h3 = [];
  points.h0 = [];
  for (var i = 0; i < bushingTests.length; ++i) {
    points.h1.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "1_c2_capacitance"]]);
    points.h2.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "2_c2_capacitance"]]);
    points.h3.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "3_c2_capacitance"]]);
    points.h0.push([bushingTests[i].test_date_for_floth, bushingTests[i][phase + "0_c2_capacitance"]]);
  }
  BushingTest.plotGraph(points, markings, graphId, '%Capacitance (C2)');
};

BushingTest.plotGraph = function (points, markings, graphId, yAxisLabel) {
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
  { label: 'H0', data: points.h0}
  ];
  var plot = $.plot(placeholder, data, options);
  $(graphId).bind("plotselected", function (event, ranges) {
    // clamp the zooming to prevent eternal zoom
    if (ranges.xaxis.to - ranges.xaxis.from < 0.00001) {
      ranges.xaxis.to = ranges.xaxis.from + 0.00001;
    }
    if (ranges.yaxis.to - ranges.yaxis.from < 0.00001) {
      ranges.yaxis.to = ranges.yaxis.from + 0.00001;
    }
    // do the zooming
    plot = $.plot($(graphId), BushingTest.getData(ranges.xaxis.from, ranges.xaxis.to, graphId),
                  $.extend(true, {}, options, {
                    xaxis: { min: ranges.xaxis.from, max: ranges.xaxis.to },
                    yaxis: { min: ranges.yaxis.from, max: ranges.yaxis.to }
                  }));
  });
};

BushingTest.loadAndPlot = function(testing, phase, graphId) {
  var url = $.url.attr('path').split("bushing_tests");
  url = url[0] + "bushing_test_conditions?testing=" + testing;
  $.getJSON(url, function(data) {
    var pf20c = data;
    var i;
    var markings = [];
    for (i = 0; i < pf20c.length; ++i) {
      if (pf20c[i].end === null) {
        pf20c[i].end = Number.MAX_VALUE;
      }
      markings.push({yaxis: {from: Number(pf20c[i].start), to: Number(pf20c[i].end)}, 
                     color: 'rgb(' + pf20c[i].color.value + ')'});
    }
    $.getJSON($.url.attr('path'), function (data) {
       var bushingTests = data;
       if (testing == 'pf_20c') { BushingTest.plotPowerFactorCor20C(bushingTests, phase, markings, graphId); }
       if (testing == 'pf') { BushingTest.plotPowerFactorAvg(bushingTests, phase, markings, graphId); }
       if (testing == 'c1') { BushingTest.plotCapacitance1(bushingTests, phase, markings, graphId); }
       if (testing == 'c2') { BushingTest.plotCapacitance2(bushingTests, phase, markings, graphId); }
    });
  });
};


$(function() {
  if ($('#bushing_test_test_date').length > 0) {
    BushingTest.setupDatePicker('#bushing_test_test_date');
  }

  BushingTest.setupTransformerNameComboxBox('bushing_test_transformer_id');

  BushingTest.computePowerFactor();

  if ($("#hv_power_factor_cor_20c_graph").length > 0) {
    BushingTest.loadAndPlot('pf_20c', 'h', "#hv_power_factor_cor_20c_graph");
    $("#reset_hv_power_factor_cor_20c").click(function () {
      BushingTest.loadAndPlot('pf_20c', 'h', "#hv_power_factor_cor_20c_graph");
    });
  }

  if ($("#hv_power_factor_avg_graph").length > 0) {
    BushingTest.loadAndPlot('pf', 'h', "#hv_power_factor_avg_graph");
    $("#reset_hv_power_factor_avg").click(function () {
      BushingTest.loadAndPlot('pf', 'h', "#hv_power_factor_avg_graph");
    });
  }

  if ($("#hv_c1_graph").length > 0) {
    BushingTest.loadAndPlot('c1', 'h',  "#hv_c1_graph");
    $("#reset_hv_c1").click(function () {
      BushingTest.loadAndPlot('c1','h',  "#hv_c1_graph");
    });
  }

   if ($("#hv_c2_graph").length > 0) {
    BushingTest.loadAndPlot('c1','h', "#hv_c2_graph");
    $("#reset_hv_c2").click(function () {
      BushingTest.loadAndPlot('c1','h', "#hv_c2_graph");
    });
  }

  if ($("#xv_power_factor_cor_20c_graph").length > 0) {
    BushingTest.loadAndPlot('pf_20c', 'x', "#xv_power_factor_cor_20c_graph");
    $("#reset_xv_power_factor_cor_20c").click(function () {
      BushingTest.loadAndPlot('pf_20c', 'x', "#xv_power_factor_cor_20c_graph");
    });
  }

  if ($("#xv_power_factor_avg_graph").length > 0) {
    BushingTest.loadAndPlot('pf', 'x', "#xv_power_factor_avg_graph");
    $("#reset_xv_power_factor_avg").click(function () {
      BushingTest.loadAndPlot('pf', 'x', "#xv_power_factor_avg_graph");
    });
  }

  if ($("#xv_c1_graph").length > 0) {
    BushingTest.loadAndPlot('c1', 'x',  "#xv_c1_graph");
    $("#reset_xv_c1").click(function () {
      BushingTest.loadAndPlot('c1','x',  "#xv_c1_graph");
    });
  }

  if ($("#xv_c2_graph").length > 0) {
    BushingTest.loadAndPlot('c1','x', "#xv_c2_graph");
    $("#reset_xv_c2").click(function () {
      BushingTest.loadAndPlot('c1','x', "#xv_c2_graph");
    });
  }
  
  
});
