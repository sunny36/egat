var OltcDga = {};

OltcDga.setupTransformerNameComboxBox = function(id) {
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
      OltcDga.onTransformerNamChange(converted.getValue());    
    });
  }
};

OltcDga.onTransformerNamChange = function(transformerId) {
  if ($('body').attr('name') == "new") {
    window.location.href = "/transformers/" + transformerId + "/oltc_dgas/new";
  }
};

var plot = [];
function plotGraph(gas, divId, points, title, yaxisLabel) {
  plot[gas] = $.jqplot(divId, [points], { 
    title: title, 
    series: [{ 
      neighborThreshold: -1 
    }], 
    axes: { 
      xaxis: { 
        renderer:$.jqplot.DateAxisRenderer, 
        tickOptions:{formatString:'%#d/%#m/%Y'},
				label: 'วันทดสอบ'
      }, 
      yaxis: { 
        renderer: $.jqplot.LogAxisRenderer, 
        tickOptions:{formatString:'%.2f'},
 				label: yaxisLabel
      } 
    }, 
    cursor:{show:true, zoom:true} 
  });
}

var app = {
  getDataPointsForGraph: function() {
    $.ajax({
      url: $.url.attr("path"),
      dataType: 'json',
      success: function(data) {
        var h2_points = [];
        var ch4_points = [];
        var c2h2_points = [];
        var c2h4_points = [];
        var c2h6_points = [];
        for (var i = 0; i < data.length; i++) {
          h2_points.push([data[i].test_date, data[i].h2]);
          ch4_points.push([data[i].test_date, data[i].ch4]);
          c2h2_points.push([data[i].test_date, data[i].c2h2]);
          c2h4_points.push([data[i].test_date, data[i].c2h4]);
          c2h6_points.push([data[i].test_date, data[i].c2h6]);
        }
        plotGraph('h2', 'h2_chart', h2_points, 
									'กราฟแสดงความสัมพันธ์ระหว่าง H<sub>2</sub> กับวันทดสอบ',
									'H<sub>2<sub> [ppm]');
        plotGraph('ch4', 'ch4_chart', ch4_points, 
								  'กราฟแสดงความสัมพันธ์ระหว่าง CH<sub>4</sub> กับวันทดสอบ',
									'CH<sub>4<sub> [ppm]');
        plotGraph('c2h2', 'c2h2_chart', c2h2_points, 
									'กราฟแสดงความสัมพันธ์ระหว่าง C<sub>2</sub>H<sub>2</sub> กับวันทดสอบ',
									'C<sub>2</sub>H<sub>2</sub> [ppm]');
        plotGraph('c2h4', 'c2h4_chart', c2h2_points,
									'กราฟแสดงความสัมพันธ์ระหว่าง C<sub>2</sub>H<sub>4</sub> กับวันทดสอบ',
									'C<sub>2</sub>H<sub>4</sub> [ppm]');
        plotGraph('c2h6', 'c2h6_chart', c2h2_points,
									'กราฟแสดงความสัมพันธ์ระหว่าง C<sub>2</sub>H<sub>6</sub> กับวันทดสอบ',
									'C<sub>2</sub>H<sub>6</sub> [ppm]');
      }
    });	  
  },

};


$(document).ready(function(){

  if(($('#h2_chart').length > 0) && ($('#ch4_chart').length > 0) &&
     ($('#c2h2_chart').length > 0) &&
     ($('#c2h4_chart').length > 0) &&
     ($('#c2h6_chart').length > 0)) {
    app.getDataPointsForGraph();
  }

  $('button.reset_zoom').click(function () {
    plot[$(this).attr('id')].resetZoom();
  });

  $('#oltc_dga_test_date').datepicker({
    dateFormat: 'dd/mm/yy',
    buttonImage: "images/icon_calendar.gif"
  });

  OltcDga.setupTransformerNameComboxBox("oltc_dga_transformer_id");

});


