function setSystemFaultLevelHvMva() {
  var busVoltageHv = parseFloat(
    $('#transformer_information_bus_voltage_hv_id :selected').text()); 
  var systemFaultLevelHv = parseFloat(
    $('#transformer_information_system_fault_level_hv').val());
  if (!isNaN(busVoltageHv) && !isNaN(systemFaultLevelHv)) {
    var systemFaultLevelHvMva = 1.732 * busVoltageHv * systemFaultLevelHv; 
    $('#transformer_information_system_fault_level_hv_mva').
      val(systemFaultLevelHvMva); 
  }
}

function setSystemFaultLevelLvMva() {
  var busVoltageLv = parseFloat(
    $('#transformer_information_bus_voltage_lv_id :selected').text()); 
  var systemFaultLevelLv = parseFloat(
    $('#transformer_information_system_fault_level_lv').val());
  if (!isNaN(busVoltageLv) && !isNaN(systemFaultLevelLv)) {
    var systemFaultLevelLvMva = 1.732 * busVoltageLv * systemFaultLevelLv; 
    $('#transformer_information_system_fault_level_lv_mva')
      .val(systemFaultLevelLvMva);     
  }
}

function plotImportanceIndex(points, transformer_names) {
  var placeholder = $("#placeholder"); 
  var options = {
      series: {lines: { show: false }, points: { show: true }},
      grid: {
          hoverable: true,
          clickable: true,
          markings: [
              {xaxis: {from: 0, to: 40}, yaxis: {from: 0, to: 40 },
                  color: 'rgb(146, 208, 80)'},
              {xaxis: {from: 40, to: 60}, yaxis: {from: 0, to: 40 },
                  color: 'rgb(206, 224, 36)'},
              {xaxis: {from: 60, to: 100}, yaxis: {from: 0, to: 40 },
                  color: 'rgb(245, 125, 25)'},
              {xaxis: {from: 0, to: 40}, yaxis: {from: 40, to: 60 },
                  color: 'rgb(206, 224, 36)'},
              {xaxis: {from: 40, to: 60}, yaxis: {from: 40, to: 60 },
                  color: 'rgb(255, 255, 0)'},
              {xaxis: {from: 60, to: 100}, yaxis: {from: 40, to: 60 },
                  color: 'rgb(252, 152, 4)'},
              {xaxis: {from: 0, to: 40}, yaxis: {from: 60, to: 100 },
                  color: 'rgb(245, 125, 25)'},
              {xaxis: {from: 40, to: 60}, yaxis: {from: 60, to: 100 },
                  color: 'rgb(252, 152, 4)'},
              {xaxis: {from: 60, to: 100}, yaxis: {from: 60, to: 100 },
                  color: 'rgb(255, 0, 5)'}
          ]
      },
      yaxis: { min: 0, max: 100, ticks: [0, 40, 60, 100] },
      xaxis: { min: 0, max: 100, ticks: [0, 40, 60, 100] }
  };
  var plot = $.plot(placeholder, [ { data: points}], options);
  o = plot.pointOffset({ x: 15, y: -1.2});
  placeholder.append('<div style="position:absolute;left:' + 
                     (o.left + 4) + 'px;top:' + o.top + 
                     'px;color:#666;font-size:smaller">Low</div>');
  o = plot.pointOffset({ x: 45, y: -1.2});
  placeholder.append('<div style="position:absolute;left:' + 
                     (o.left + 4) + 'px;top:' + o.top + 
                     'px;color:#666;font-size:smaller">Moderate</div>');
  o = plot.pointOffset({ x: 75, y: -1.2});
  placeholder.append('<div style="position:absolute;left:' + 
                     (o.left + 4) + 'px;top:' + o.top + 
                     'px;color:#666;font-size:smaller">High</div>');
  o = plot.pointOffset({ x: -4.2, y: 20});
  placeholder.append('<div style="position:absolute;left:' + 
                     (o.left + 4) + 'px;top:' + o.top + 
                     'px;color:#666;font-size:smaller">Good</div>'); 
  o = plot.pointOffset({ x: -4.2, y: 50});
  placeholder.append('<div style="position:absolute;left:' + 
                     (o.left + 4) + 'px;top:' + o.top + 
                     'px;color:#666;font-size:smaller">Fair</div>');
  o = plot.pointOffset({ x: -4.2, y: 80});
  placeholder.append('<div style="position:absolute;left:' + 
                     (o.left + 4) + 'px;top:' + o.top + 
                     'px;color:#666;font-size:smaller">Poor</div>'); 
   var previousPoint = null;
   $("#placeholder").bind("plothover", function (event, pos, item) {
     $("#x").text(pos.x.toFixed(2));
     $("#y").text(pos.y.toFixed(2));
     if (item) {
       if (previousPoint != item.datapoint) {
         previousPoint = item.datapoint;
         $("#tooltip").remove();
         var x = item.datapoint[0].toFixed(2),
         y = item.datapoint[1].toFixed(2);
         showTooltip(item.pageX, item.pageY, transformer_names[item.dataIndex] + 
                     "(" + x + "," + y + ")"); 
       }
     }
     else {
       $("#tooltip").remove();
       previousPoint = null;            
     }
   });
  
}

function showTooltip(x, y, contents) {
  $('<div id="tooltip">' + contents + '</div>').css({
    position: 'absolute',
    display: 'none',
    top: y + 5,
    left: x + 5,
    border: '1px solid #fdd',
    padding: '2px',
    'background-color': '#fee',
    opacity: 0.90
  }).appendTo("body").fadeIn(200);
}


var app = {
  setupAjax: function () {
    jQuery.ajaxSetup({ 
      'beforeSend': function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript");
      }
    });    
  },
  
  hideElements: function () {
    $('#transformer_name_label').hide();
    $('#transformer_name_select').hide();
    $('#transformers').hide();
  },
  
  setupBusVoltageAndSystemFaultLevel: function () {
    $('#transformer_information_bus_voltage_hv_id').change(function () {
      setSystemFaultLevelHvMva(); 
    });

    $('#transformer_information_system_fault_level_hv').blur(function () {
      setSystemFaultLevelHvMva(); 
    });
    
    $('#transformer_information_bus_voltage_lv_id').change(function () {
      setSystemFaultLevelLvMva(); 
    });

    $('#transformer_information_system_fault_level_lv').blur(function () {
      setSystemFaultLevelLvMva(); 
    });    
  },
  
  setupRecordedDate: function () {
    $("#transformer_information_recorded_date").datepicker({
      showOn: 'both',
      buttonImage: '/images/icon_calendar.gif',
      buttonImageOnly: true
    });    
  },
  
  getPointsForGraphs: function () {
    $.get('/transformer_informations?q=data_points', function(data) {
      var data_points = eval('(' + data + ')');
      var points = []; 
      var transformer_names = []; 
      for (var i = 0; i < data_points.length; ++i) { 
        points.push([parseFloat(data_points[i][1]), parseFloat(data_points[i][2])]);
        transformer_names.push(data_points[i][0]); 
      }
      plotImportanceIndex(points, transformer_names);
    });
  },
  
  setupTransformerNameComboxBox: function () {
    $.getScript('/javascripts/jquery.combobox.js', function () {
      $(function() {
        $("#transformer_information_transformer_id").combobox();
      });      
    });
  },
  
  setupDamageOfProperty: function () {
    $("#damage_of_property_1, #damage_of_property_2, #damage_of_property_3," +
      "#damage_of_property_4").click(function() {
        if ($('#damage_of_property_1').attr('checked') || 
            $('#damage_of_property_2').attr('checked') ||
            $('#damage_of_property_3').attr('checked') ||
            $('#damage_of_property_4').attr('checked')) {
          $('#damage_of_property_5').attr('disabled', true); 
        } 
        if (!$('#damage_of_property_1').attr('checked') && 
            !$('#damage_of_property_2').attr('checked') &&
            !$('#damage_of_property_3').attr('checked') &&
            !$('#damage_of_property_4').attr('checked')) {
          $('#damage_of_property_5').attr('disabled', false); 
        }
      });

    $('#damage_of_property_5').click(function () {
      if ($('#damage_of_property_5').attr('checked')) { 
        $('#damage_of_property_1').attr('disabled', true); 
        $('#damage_of_property_2').attr('disabled', true); 
        $('#damage_of_property_3').attr('disabled', true); 
        $('#damage_of_property_4').attr('disabled', true); 
      }
      if (!$('#damage_of_property_5').attr('checked')) { 
        $('#damage_of_property_1').attr('disabled', false); 
        $('#damage_of_property_2').attr('disabled', false); 
        $('#damage_of_property_3').attr('disabled', false); 
        $('#damage_of_property_4').attr('disabled', false); 
      }
    });     
  }
}; 


$(document).ready(function() {
  app.setupAjax();
  
  app.hideElements(); 
  
  app.setupBusVoltageAndSystemFaultLevel();
  
  app.setupRecordedDate();
  
  app.getPointsForGraphs();

  app.setupTransformerNameComboxBox();
  
  app.setupDamageOfProperty();
  
  $('#station_station').change(function() {
    var region = $('#station_station :selected').text();
    if (region != 'Please select') {
      $.get('/transformers?region=' + region, function(data) {
        var transformers = eval('(' + data + ')');
        console.log(transformers);
        $("#station_transformer_name").html("");
        $('#transformer_names').tmpl(transformers).appendTo('#station_transformer_name');
        $("#station_transformer_name").prepend("<option value='' selected='selected'></option>");
        $('#transformer_name_label').show();
        $('#transformer_name_select').show();
        $("#transformers_table tbody").children().remove();
        $('#transformers_script').tmpl(transformers).appendTo('#transformers_table');        
        $('#transformers').show();
      });
      var url = '/transformer_informations?q=data_points&region=' + region;
      $.get(url, function(data) {
        var data_points = eval('(' + data + ')');
        var points = []; 
        var transformer_names = []; 
        for (var i = 0; i < data_points.length; ++i) { 
          points.push([parseFloat(data_points[i][1]), 
                       parseFloat(data_points[i][2])]);
          transformer_names.push(data_points[i][0]); 
        }
        plotImportanceIndex(points, transformer_names);
      });      
    }
  });
  
  
});
