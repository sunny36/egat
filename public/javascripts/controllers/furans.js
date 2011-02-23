var Furan = {};

Furan.setupTransformerNameComboxBox = function(id) {
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
        Furan.onTransformerNamChange(converted.getValue());    
    });
  }
};

Furan.onTransformerNamChange = function(transformerId) {
  if ($('body').attr('name') == "new") {
    window.location.href = "/transformers/" + transformerId + "/furans/new";
  }
};

Furan.points = null;

Furan.getData = function (x1, x2) {
  var points = [];
  for (var i = 0; i < Furan.points.length; ++i) {
    if (Furan.points[i][0] >= x1 && Furan.points[i][0] <= x2) {
      points.push([Furan.points[i][0], Furan.points[i][1]]);
    }
  }
  return [{data: points}];
};

Furan.plotGraph = function (furans) {
  var points = [];
  for (var i = 0; i < furans.length; ++i) {
    points.push([furans[i].test_date_for_floth, furans[i].fal]);
  }
  Furan.points = points;
  var placeholder = $("#placeholder"); 
  var options = {
    series: {lines: { show: true }, points: { show: true }},
    xaxis: {
      mode: "time",
      timeformat: "%d/%m/%y",
			axisLabel: 'วันทดสอบ'
    },
		yaxis: {
			axisLabel: '2-FAL [ppb]',
			axisLabelUseCanvas: false
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
      plot = $.plot($("#placeholder"), Furan.getData(ranges.xaxis.from, ranges.xaxis.to),
        $.extend(true, {}, options, {
            xaxis: { min: ranges.xaxis.from, max: ranges.xaxis.to },
            yaxis: { min: ranges.yaxis.from, max: ranges.yaxis.to }
      }));
  });

};

$(document).ready(function(){
    $('#furan_test_date').datepicker({
        dateFormat: 'dd/mm/yy',
        buttonImage: "images/icon_calendar.gif"
    });

    Furan.setupTransformerNameComboxBox("furan_transformer_id");

		if($('#placeholder').length > 0) {
			$.ajax({
	        url: $.url.attr("path"),
	        dataType: 'json',
	        success: function(data) {
	          var furans = data;
	          Furan.plotGraph(furans);
	        }
	    });
	    $("#reset").click(function () {
	        $.ajax({
	            url: $.url.attr("path"),
	            dataType: 'json',
	            success: function(data) {
	              var furans = data;
	              Furan.plotGraph(furans);
	            }
	        });
	    });  	    
		}
});

