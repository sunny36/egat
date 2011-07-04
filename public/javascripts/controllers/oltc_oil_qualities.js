var OltcOilQuality = {};

OltcOilQuality.dielectricBreakdownPoints = null;
OltcOilQuality.corPowerFactorPoints = null;
OltcOilQuality.waterContentPoints = null;
OltcOilQuality.colorPoints = null;

OltcOilQuality.getData = function (x1, x2, graphId) {
  var points = [];
  var dataPoints;
  if (graphId == '#dielectric_breakdown_graph') {
    dataPoints = OltcOilQuality.dielectricBreakdownPoints;
  }
  if (graphId == '#pf_20c_graph') {
    dataPoints = OltcOilQuality.corPowerFactorPoints;
  }
  if (graphId == '#water_content_graph') {
    dataPoints = OltcOilQuality.waterContentPoints;
  }
  if (graphId == '#color_graph') {
    dataPoints = OltcOilQuality.colorPoints;
  }
  for (var i = 0; i < dataPoints.length; ++i) {
    if (dataPoints[i][0] >= x1 && dataPoints[i][0] <= x2) {
      points.push([dataPoints[i][0], dataPoints[i][1]]);
    }
  }
  return [{data: points}];
};

OltcOilQuality.plotDielectricBreakdown = function(insulatingOils, markings, graphId) {
  var points = [];
  for (var i = 0; i < insulatingOils.length; ++i) {
    points.push([insulatingOils[i].test_date_for_floth, insulatingOils[i].xi_average_oltc]);
  }
  OltcOilQuality.dielectricBreakdownPoints = points;
  OltcOilQuality.plotGraph(points, markings, graphId, 'Dielectric Breakdown [kV]');
};

OltcOilQuality.plotCorPowerFactor = function(insulatingOils, markings, graphId) {
  var points = [];
  for (var i = 0; i < insulatingOils.length; ++i) {
    points.push([insulatingOils[i].test_date_for_floth, insulatingOils[i].cor_percent_power_factor_oltc]);
  }
  OltcOilQuality.corPowerFactorPoints = points;
  OltcOilQuality.plotGraph(points, markings, graphId, '%Power Factor at 20C');
};

OltcOilQuality.plotWaterContent = function(oltcOilContaminations, markings, graphId) {
  var points = [];
  for (var i = 0; i < oltcOilContaminations.length; ++i) {
    points.push([oltcOilContaminations[i].test_date_for_floth, oltcOilContaminations[i].water_content]);
  }
  OltcOilQuality.waterContentPoints = points;
  OltcOilQuality.plotGraph(points, markings, graphId, 'Water Content [ppm]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
};

OltcOilQuality.plotColor = function(oltcOilContaminations, markings, graphId) {
  var points = [];
  for (var i = 0; i < oltcOilContaminations.length; ++i) {
    points.push([oltcOilContaminations[i].test_date_for_floth, oltcOilContaminations[i].color]);
  }
  OltcOilQuality.colorPoints = points;
  OltcOilQuality.plotGraph(points, markings, graphId, 'Color&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
};

OltcOilQuality.plotGraph = function (points, markings, graphId, yAxisLabel) {
  var placeholder = $(graphId);
  var options = {
    series: {lines: { show: true }, points: { show: true }},
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
  var plot = $.plot(placeholder, [ { data: points}], options);
  $(graphId).bind("plotselected", function (event, ranges) {
    // clamp the zooming to prevent eternal zoom
    if (ranges.xaxis.to - ranges.xaxis.from < 0.00001) {
      ranges.xaxis.to = ranges.xaxis.from + 0.00001;
    }
    if (ranges.yaxis.to - ranges.yaxis.from < 0.00001) {
      ranges.yaxis.to = ranges.yaxis.from + 0.00001;
    }
    // do the zooming
    plot = $.plot($(graphId), OltcOilQuality.getData(ranges.xaxis.from, ranges.xaxis.to, graphId),
                  $.extend(true, {}, options, {
                    xaxis: { min: ranges.xaxis.from, max: ranges.xaxis.to },
                    yaxis: { min: ranges.yaxis.from, max: ranges.yaxis.to }
                  }));
  });
};

OltcOilQuality.loadAndPlotDielectricBreakdown = function() {
  $.getJSON($.url.attr('path') + '?name=xbar', function(data) {
    var oltcOilQualities = data;
    var i;
    var markings = [];
    for (i = 0; i < oltcOilQualities.length; ++i) {
      if (oltcOilQualities[i].end === null) {
        oltcOilQualities[i].end = Number.MAX_VALUE;
      }
      markings.push({yaxis: {from: Number(oltcOilQualities[i].start), to: Number(oltcOilQualities[i].end)},
                     color: 'rgb(' + oltcOilQualities[i].color.value + ')'});
    }
    $.getJSON("/" + $.url.segment(0) + "/" + $.url.segment(1) + "/" + "insulating_oils", function (data) {
      var insulatingOils = data;
      OltcOilQuality.plotDielectricBreakdown(insulatingOils, markings, '#dielectric_breakdown_graph');
    });
  });
};

OltcOilQuality.loadAndPlotCorPowerFactor = function() {
  $.getJSON($.url.attr('path') + '?name=pf_20c', function(data) {
    var oltcOilQualities = data;
    var i;
    var markings = [];
    for (i = 0; i < oltcOilQualities.length; ++i) {
      if (oltcOilQualities[i].end === null) {
        oltcOilQualities[i].end = Number.MAX_VALUE;
      }
      markings.push({yaxis: {from: Number(oltcOilQualities[i].start), to: Number(oltcOilQualities[i].end)},
                     color: 'rgb(' + oltcOilQualities[i].color.value + ')'});
    }
    $.getJSON("/" + $.url.segment(0) + "/" + $.url.segment(1) + "/" + "insulating_oils", function (data) {
      var insulatingOils = data;
      OltcOilQuality.plotCorPowerFactor(insulatingOils, markings, '#pf_20c_graph');
    });
  });
};

OltcOilQuality.loadAndPlotWaterContent = function() {
  $.getJSON($.url.attr('path') + '?name=water_content', function(data) {
    var oltcOilQualities = data;
    var i;
    var markings = [];
    for (i = 0; i < oltcOilQualities.length; ++i) {
      if (oltcOilQualities[i].end === null) {
        oltcOilQualities[i].end = Number.MAX_VALUE;
      }
      markings.push({yaxis: {from: Number(oltcOilQualities[i].start), to: Number(oltcOilQualities[i].end)},
                     color: 'rgb(' + oltcOilQualities[i].color.value + ')'});
    }
    $.getJSON("/" + $.url.segment(0) + "/" + $.url.segment(1) + "/" + "oltc_oil_contaminations", function (data) {
       var waterContents = data;
       OltcOilQuality.plotWaterContent(waterContents, markings, "#water_content_graph");
    });
  });
};

OltcOilQuality.loadAndPlotColor = function() {
  $.getJSON($.url.attr('path') + '?name=color', function(data) {
    var oltcOilQualities = data;
    var i;
    var markings = [];
    for (i = 0; i < oltcOilQualities.length; ++i) {
      if (oltcOilQualities[i].end === null) {
        oltcOilQualities[i].end = Number.MAX_VALUE;
      }
      markings.push({yaxis: {from: Number(oltcOilQualities[i].start), to: Number(oltcOilQualities[i].end)},
                     color: 'rgb(' + oltcOilQualities[i].color.value + ')'});
    }
    $.getJSON("/" + $.url.segment(0) + "/" + $.url.segment(1) + "/" + "oltc_oil_contaminations", function (data) {
       var colors = data;
       OltcOilQuality.plotColor(colors, markings, "#color_graph");
    });
  });
};

$(document).ready(function(){
  if ($("#dielectric_breakdown_graph").length > 0) {
    OltcOilQuality.loadAndPlotDielectricBreakdown();
    $("#reset_dielectric_breakdown").click(function () {
      OltcOilQuality.loadAndPlotDielectricBreakdown();
    });
  }
  
  if ($("#pf_20c_graph").length > 0) {
    OltcOilQuality.loadAndPlotCorPowerFactor();
    $("#reset_pf_20c").click(function () {
      OltcOilQuality.loadAndPlotCorPowerFactor();
    });
  }
  
  OltcOilQuality.loadAndPlotWaterContent();
  $("#reset_water_content").click(function () {
    OltcOilQuality.loadAndPlotWaterContent();
  });

  OltcOilQuality.loadAndPlotColor();
  $("#reset_color").click(function () {
    OltcOilQuality.loadAndPlotColor();
  });

});