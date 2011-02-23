PowerFactor = {};

PowerFactor.points = null;

PowerFactor.getData = function (x1, x2) {
  var points = [];
  for (var i = 0; i < PowerFactor.points.length; ++i) {
    if (PowerFactor.points[i][0] >= x1 && PowerFactor.points[i][0] <= x2) {
      points.push([PowerFactor.points[i][0], PowerFactor.points[i][1]]);
    }
  }
  return [{data: points}];
};

PowerFactor.plotGraph = function (powerFactors) {
  var points = [];
  for (var i = 0; i < powerFactors.length; ++i) {
    points.push([powerFactors[i].test_date_for_floth, powerFactors[i].cor_percent_power_factor_maintank]);
  }
  PowerFactor.points = points;
  var placeholder = $("#placeholder"); 
  var options = {
    series: {lines: { show: true }, points: { show: true }},
    xaxis: {
      mode: "time",
      timeformat: "%d/%m/%y"
    },
    grid: {
      hoverable: true,
      clickable: true,
      markings: [
        {yaxis: {from: 0, to: 0.5 }, color: 'rgb(0, 255, 0)'},
        {yaxis: {from: 0.5, to: 1.0 }, color: 'rgb(0,0,255)'},
        {yaxis: {from: 1.0, to: 1.5 }, color: 'rgb(0,255,255)'},
        {yaxis: {from: 1.5, to: 2.0 }, color: 'rgb(255,146,0)'},
        {yaxis: {from: 2.0, to: Number.MAX_VALUE }, color: 'rgb(255,0,0)'}
      ]
    },
    selection: { mode: "xy" }
  };
  var plot = $.plot(placeholder, [ { data: points}], options);
  $("#placeholder").bind("plotselected", function (event, ranges) {
      // clamp the zooming to prevent eternal zoom
      if (ranges.xaxis.to - ranges.xaxis.from < 0.00001) {
        ranges.xaxis.to = ranges.xaxis.from + 0.00001;
      }
      if (ranges.yaxis.to - ranges.yaxis.from < 0.00001) {
        ranges.yaxis.to = ranges.yaxis.from + 0.00001;
      }
      // do the zooming
      plot = $.plot($("#placeholder"), PowerFactor.getData(ranges.xaxis.from, ranges.xaxis.to),
        $.extend(true, {}, options, {
            xaxis: { min: ranges.xaxis.from, max: ranges.xaxis.to },
            yaxis: { min: ranges.yaxis.from, max: ranges.yaxis.to }
      }));
  });

};

$(function() {
    $.ajax({
        url: $.url.attr("path"),
        dataType: 'json',
        success: function(data) {
          console.log(data);
          var powerFactors = data;
          PowerFactor.plotGraph(powerFactors);
        }
    });
    $("#reset").click(function () {
        $.ajax({
            url: $.url.attr("path"),
            dataType: 'json',
            success: function(data) {
              console.log(data);
              var powerFactors = data;
              PowerFactor.plotGraph(powerFactors);
            }
        });

    });  
});
