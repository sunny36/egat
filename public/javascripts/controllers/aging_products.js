var AgingProduct = {};

AgingProduct.getData = function (x1, x2, graphId) {
  var points = [];
	var dataPoints;
	if (graphId == '#aging_product_graph') {
		dataPoints = AgingProduct.iftByNnPoints;
	}	
  for (var i = 0; i < dataPoints.length; ++i) {
    if (dataPoints[i][0] >= x1 && dataPoints[i][0] <= x2) {
      points.push([dataPoints[i][0], dataPoints[i][1]]);
    }
  }
  return [{data: points}];
};

AgingProduct.plotOilContamination = function(oilContaminations, markings, graphId, yAxisLabel) {
  var points = [];
	var iftByNn;
	  for (var i = 0; i < oilContaminations.length; ++i) {
		iftByNn = oilContaminations[i]["ift"] / oilContaminations[i]["nn"];
	    points.push([oilContaminations[i].test_date_for_floth, iftByNn]);
	  }
  AgingProduct["iftByNnPoints"] = points;
  AgingProduct.plotGraph(points, markings, graphId, yAxisLabel);
};

AgingProduct.plotGraph = function (points, markings, graphId, yAxisLabel) {
  var placeholder = $(graphId); 
  var options = {
    series: {lines: { show: true }, points: { show: true }},
    xaxis: {mode: "time", timeformat: "%d/%m/%y", axisLabel: 'วันทดสอบ'},
    yaxis: {
      axisLabel: yAxisLabel,
      axisLabelUseCanvas: false
      //min: 0, max: 100, ticks: [0, 40, 60, 100]
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
    plot = $.plot($(graphId), AgingProduct.getData(ranges.xaxis.from, ranges.xaxis.to, graphId),
                  $.extend(true, {}, options, {
                    xaxis: { min: ranges.xaxis.from, max: ranges.xaxis.to },
                    yaxis: { min: ranges.yaxis.from, max: ranges.yaxis.to }
                  }));
  });
};

AgingProduct.loadAndPlotOilContamination = function(graphId, yAxisLabel) {
	$.getJSON($.url.attr('path') + '?name=ift/nn' , function(data) {
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
			 AgingProduct.plotOilContamination(oilContaminations, markings, graphId, yAxisLabel);
    });
  });  
};


$(document).ready(function(){

	AgingProduct.loadAndPlotOilContamination('#aging_product_graph', 
																				 'IFT/NN &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
	$("#reset_aging_product").click(function () {
		AgingProduct.loadAndPlotOilContamination('#aging_product_graph', 
																					 'IFT/NN &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');		
	});  	    

});