var OilDgas = {};

OilDgas.setupTransformerNameComboxBox = function(id) {
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
      OilDgas.onTransformerNamChange(converted.getValue());    
    });
  }
};

OilDgas.onTransformerNamChange = function(transformerId) {
  if ($('body').attr('name') == "new") {
    window.location.href = "/transformers/" + transformerId + "/oil_dgas/new";
  }
};

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
	      plotGraph('h2', 'h2_chart', h2_points, 'H2');
	      plotGraph('ch4', 'ch4_chart', ch4_points, 'CH4');
	      plotGraph('c2h2', 'c2h2_chart', c2h2_points, 'C2H2');
	      plotGraph('c2h4', 'c2h4_chart', c2h2_points, 'C2H4');
	      plotGraph('c2h6', 'c2h6_chart', c2h2_points, 'C2H6');
	    }
	  });	  
	},
	
	onTransformerNameDropDownListBlur: function() {
		$('#ext-gen5').live('blur', function () {
	    if($(this).attr('value').length > 0) {
	      var transformerName = $(this).attr('value'); 
	      $.getJSON('/transformers/show/' + transformerName, function(data) {
	        var transformer = data;
	        $('span#transformer_name').text(transformer.transformer_name);
	        $('span#transformer_equipment_no').text(transformer.egatsn);
	        $('span#transformer_first_energized').text(transformer.first_energize);
	        $('span#transformer_manufacture').text(transformer.brand.name);
	      });
	    }
	    $('#transformer_details').slideDown();
	  });	  		
	}
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

  $('#oil_dga_test_date').datepicker({
    dateFormat: 'dd/mm/yy',
    buttonImage: "images/icon_calendar.gif"
  });

	OilDgas.setupTransformerNameComboxBox("oil_dga_transformer_id");

  $('#transformer_details').hide();  
});


