var plot = [];
function plotGraph(gas, divId, points, title) {
  plot[gas] = $.jqplot(divId, [points], { 
    title: title, 
    series: [{ 
      neighborThreshold: -1 
    }], 
    axes: { 
      xaxis: { 
        renderer:$.jqplot.DateAxisRenderer, 
        tickOptions:{formatString:'%#d/%#m/%Y'}
      }, 
      yaxis: { 
        renderer: $.jqplot.LogAxisRenderer, 
        tickOptions:{formatString:'%.2f'} 
      } 
    }, 
    cursor:{show:true, zoom:true} 
  });
}

$(document).ready(function(){
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
      plotGraph('h2', 'h2_chart', h2_points, 'H2');
      plotGraph('ch4', 'ch4_chart', ch4_points, 'CH4');
      plotGraph('c2h2', 'c2h2_chart', c2h2_points, 'C2H2');
      plotGraph('c2h4', 'c2h4_chart', c2h2_points, 'C2H4');
      plotGraph('c2h6', 'c2h6_chart', c2h2_points, 'C2H6');
    }
  });

  $('button.reset_zoom').click(function () {
    plot[$(this).attr('id')].resetZoom();
  });
});


