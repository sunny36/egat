var OilQuality = {};

OilQuality.getData = function (x1, x2, graphId) {
  var points = [];
	var dataPoints;
	if (graphId == '#dielectric_breakdown_graph') {
		dataPoints = OilQuality.dielectricBreakdownPoints;
	}
	if (graphId == '#ift_graph') {
		dataPoints = OilQuality.iftPoints;
	}	
	if (graphId == '#nn_graph') {
		dataPoints = OilQuality.nnPoints;
	}		
	if (graphId == '#water_content_graph') {
		dataPoints = OilQuality.waterContentPoints;
	}
	if (graphId == '#color_graph') {
		dataPoints = OilQuality.colorPoints;
	}	
  for (var i = 0; i < dataPoints.length; ++i) {
    if (dataPoints[i][0] >= x1 && dataPoints[i][0] <= x2) {
      points.push([dataPoints[i][0], dataPoints[i][1]]);
    }
  }
  return [{data: points}];
};

OilQuality.plotDielectricBreakdown = function(insulatingOils, markings, graphId) {
  var points = [];
  for (var i = 0; i < insulatingOils.length; ++i) {
    points.push([insulatingOils[i].test_date_for_floth, insulatingOils[i].xi_average_maintank]);
  }
  OilQuality.dielectricBreakdownPoints = points;
  OilQuality.plotGraph(points, markings, graphId, 'Dielectric Breakdown [kV]');
};

OilQuality.plotOilContamination = function(oilContaminations, name, markings, graphId, yAxisLabel) {
  var points = [];
  for (var i = 0; i < oilContaminations.length; ++i) {
    points.push([oilContaminations[i].test_date_for_floth, oilContaminations[i][name]]);
  }
  OilQuality[name + "Points"] = points;
  OilQuality.plotGraph(points, markings, graphId, yAxisLabel);
};

OilQuality.plotGraph = function (points, markings, graphId, yAxisLabel) {
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
    plot = $.plot($(graphId), OilQuality.getData(ranges.xaxis.from, ranges.xaxis.to, graphId),
                  $.extend(true, {}, options, {
                    xaxis: { min: ranges.xaxis.from, max: ranges.xaxis.to },
                    yaxis: { min: ranges.yaxis.from, max: ranges.yaxis.to }
                  }));
  });
};

OilQuality.loadAndPlotDielectricBreakdown = function() {
  $.getJSON($.url.attr('path') + '?name=xbar', function(data) {
    var oilQualities = data;
    var i;
    var markings = [];
    for (i = 0; i < oilQualities.length; ++i) {				
      if (oilQualities[i].end === null) {
        oilQualities[i].end = Number.MAX_VALUE;
      }
			if (oilQualities[i].start == null) {
				oilQualities[i].start = -Number.MAX_VALUE;
			}
      markings.push({yaxis: {from: Number(oilQualities[i].start), to: Number(oilQualities[i].end)}, 
                     color: 'rgb(' + oilQualities[i].color.value + ')'});
    }
    $.getJSON("/" + $.url.segment(0) + "/" + $.url.segment(1) + "/" + "insulating_oils", function (data) {
      var insulatingOils = data;
      OilQuality.plotDielectricBreakdown(insulatingOils, markings, '#dielectric_breakdown_graph');
    });
  });	
};

OilQuality.loadAndPlotOilContamination = function(name, graphId, yAxisLabel) {
	$.getJSON($.url.attr('path') + '?name=' + name, function(data) {
    var oilQualities = data;
    var i;
    var markings = [];
    for (i = 0; i < oilQualities.length; ++i) {				
			if (oilQualities[i].start === null) {
        oilQualities[i].start = -Number.MAX_VALUE;
      }      
      if (oilQualities[i].end === null) {
        oilQualities[i].end = Number.MAX_VALUE;
      }
      markings.push({yaxis: {from: Number(oilQualities[i].start), to: Number(oilQualities[i].end)}, 
                     color: 'rgb(' + oilQualities[i].color.value + ')'});
    }
    $.getJSON("/" + $.url.segment(0) + "/" + $.url.segment(1) + "/" + "oil_contaminations", function (data) {
	     var oilContaminations = data;
			 OilQuality.plotOilContamination(oilContaminations, name, markings, graphId, yAxisLabel);
    });
  });  
};


$(document).ready(function(){
	OilQuality.loadAndPlotDielectricBreakdown();
	$("#reset_dielectric_breakdown").click(function () {
		OilQuality.loadAndPlotDielectricBreakdown();
  });  	    

	OilQuality.loadAndPlotOilContamination('ift', '#ift_graph', 
																				 'IFT [dynes/cm] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
	$("#reset_ift").click(function () {
		OilQuality.loadAndPlotOilContamination('ift', '#ift_graph', 
																					 'IFT [dynes/cm] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');		
	});  	    

  OilQuality.loadAndPlotOilContamination('nn', '#nn_graph', 'Acidity (NN) [mg KOH/gm]');
	$("#reset_nn").click(function () {
		OilQuality.loadAndPlotOilContamination('nn', '#nn_graph', 'Acidity (NN) [mg KOH/gm]');
	});  	    

	OilQuality.loadAndPlotOilContamination('water_content', '#water_content_graph', 
																				 'Water Content [ppm]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
	$("#reset_water_content").click(function () {
		OilQuality.loadAndPlotOilContamination('water_content', '#water_content_graph', 
																					 'Water Content [ppm]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');		
	});  	    
	
	OilQuality.loadAndPlotOilContamination('color', '#color_graph', 
																				 'Color&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');	
	$("#reset_color").click(function () {
		OilQuality.loadAndPlotOilContamination('color', '#color_graph', 
																					 'Color&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');		
	});  	    	
});