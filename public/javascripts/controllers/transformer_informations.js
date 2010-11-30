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

function plotRiskGraph(points, transformer_names) {
  var d2 = [[39.598, 0], [0, 39.598]];
  var d3 = [[79.1959594928933, 0], [0, 79.1959594928933]];
  var d4 = [[100, 0], [0,100]];
  var d5 = [[118.79393923934, 0], [0, 118.79393923934]];
  var d6 = [[158.391918985787, 0], [0, 158.391918985787]];
  var d7 = [[200.818325856979, 0], [0, 200.818325856979]];
  var options = {
    grid: {hoverable: true,clickable: true},
    yaxis: { min: 0, max: 100, ticks: [0, 40, 60, 100], 
             axisLabel: 'Probability of Failure',
             axisLabelUseCanvas: false,
             axisLabelFontSizePixels: 12,
             axisLabelFontFamily: 'Arial' },
    xaxis: { min: 0, max: 100, ticks: [0, 40, 60, 100], 
             axisLabel: 'Transformer Importance',
             axisLabelUseCanvas: true,
             axisLabelFontSizePixels: 12,
             axisLabelFontFamily: 'Arial' }
    }; 
  $.plot($("#placeholder"), [
    {
      data: d7, 
      lines: { show: true, fill: true, fillColor: 'rgb(255, 0, 0)', lineWidth: 0}
    },          
    {
      data: d6,
      lines: { show: true, fill: true, fillColor: 'rgb(255, 146, 0)', lineWidth: 0}
    },          
    {
      data: d5,
      lines: { show: true, fill: true, fillColor: 'rgb(255, 255, 0)', lineWidth: 0}
    },        
    {
      data: d4,
      lines: { show: true, fill: true, fillColor: 'rgb(255, 255, 0)', lineWidth: 0}
    },    
    {
      data: d3,
      lines: { show: true, fill: true, fillColor: 'rgb(0, 0, 255)', lineWidth: 0}
    },
    {
      data: d2,
      lines: { show: true, fill: true, fillColor: 'rgb(0, 255, 0)', lineWidth: 0}
    },
    {
      data: points,
      lines: { show: false},
      points: { show: true }
    }], options);
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
    yaxis: { min: 0, max: 100, ticks: [0, 40, 60, 100], 
             axisLabel: 'Probability of Failure',
             axisLabelUseCanvas: false,
             axisLabelFontSizePixels: 12,
             axisLabelFontFamily: 'Arial' },
    xaxis: { min: 0, max: 100, ticks: [0, 40, 60, 100], 
             axisLabel: 'Transformer Importance',
             axisLabelUseCanvas: true,
             axisLabelFontSizePixels: 12,
             axisLabelFontFamily: 'Arial' }
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
  o = plot.pointOffset({ x: -8.9, y: 20});
  placeholder.append('<div style="position:absolute;left:' + 
                     (o.left + 4) + 'px;top:' + o.top + 
                     'px;color:#666;font-size:smaller">Good</div>'); 
  o = plot.pointOffset({ x: -5.9, y: 50});
  placeholder.append('<div style="position:absolute;left:' + 
                     (o.left + 4) + 'px;top:' + o.top + 
                     'px;color:#666;font-size:smaller">Fair</div>');
  o = plot.pointOffset({ x: -7.9, y: 80});
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
    var url = jQuery.url.attr("path") + "?q=data_points";
    if (jQuery.url.param("region") != null)  {
      url += "&region=" + encodeURI(jQuery.url.param("region"));
    } 
    $.get(url, function(data) {
      var data_points = eval('(' + data + ')');
      var points = []; 
      var transformer_names = []; 
      var checkedTransformerNames = [];
      $('.transformer_checkbox:checked').each(function () {
        checkedTransformerNames.push(
          $(this).parent().parent().children()[1].innerHTML);
      });
      for (var i = 0; i < data_points.length; ++i) { 
        if (jQuery.inArray(data_points[i][0], checkedTransformerNames) > -1) {          
          points.push([parseFloat(data_points[i][1]), parseFloat(data_points[i][2])]);
          transformer_names.push(data_points[i][0]); 
          
        }
      }
      if (jQuery.url.param("graph") == "risk") { 
        plotRiskGraph(points, transformer_names);
      } else {
        plotImportanceIndex(points, transformer_names);
      }
      
    });
  },
  
  setupTransformerNameComboxBox: function () {
    var converted;
    if ($('#transformer_transformer_id').length > 0) {
      converted = new Ext.form.ComboBox({
        typeAhead: true,
        triggerAction: 'all',
        transform:'transformer_transformer_id',
        width:200,
        forceSelection:true
      });
    }
    if ($('#transformer_information_transformer_id').length > 0) {
      converted = new Ext.form.ComboBox({
        typeAhead: true,
        triggerAction: 'all',
        transform:'transformer_information_transformer_id',
        width:340,
        forceSelection:true
      });
    }
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
  $('a.title').cluetip({dropShadow: false, cluetipClass: 'rounded', showTitle: false});
  
  $('a[rel*=facybox]').facybox();

  app.setupAjax();

  app.hideElements(); 
  
  app.setupBusVoltageAndSystemFaultLevel();
  
  app.setupRecordedDate();
  
  if ($('#placeholder').length > 0) {
    app.getPointsForGraphs();
  }

  app.setupTransformerNameComboxBox();

  app.setupDamageOfProperty();
  
  $('#select_all').attr('checked', true);
  $('.transformer_checkbox').attr('checked', true);
  
  $('.transformer_checkbox').change(function () {
    var allChecked = true;
    $('.transformer_checkbox').each(function() {
      if (!$(this).attr('checked')) {
       allChecked = false;
      }
    });
    if (!allChecked) {
     $('#select_all').attr('checked', false);
    } else {
      $('#select_all').attr('checked', true);
    }
    app.getPointsForGraphs();
  });
  
  $('#select_all').change(function () {
    if ($(this).attr('checked')) {
      $('.transformer_checkbox').each(function () {
        $(this).attr('checked', true);
      });
    } else {
      $('.transformer_checkbox').each(function () {
        $(this).attr('checked', false);
      });      
    }
  });
  
  
  $('#station_station').change(function() {
    var region = $('#station_station :selected').text();
    var queryString = "?";
    if (jQuery.url.param("graph") != undefined) {
      queryString = "graph=" + jQuery.url.param("graph");
    }    
    if (region != 'All') {
      queryString += "&region=" + encodeURI(region); 
      window.location.replace('/transformer_informations' + queryString);
    } else {
      window.location.replace('/transformer_informations' + queryString);
    }
  });
    
  $('.importance_index').live('click', function () {
    var id = $(this).parents('tr:first').find('td:first').text();
    jQuery.facybox({ajax: '/transformer_informations/show/' + id});
    return false;
  });

  // $('.transformer_checkbox').click(function () {
  //   var ids = "";
  //   $('.transformer_checkbox:checked').each(function () {
  //     ids = ids + $(this).attr('id').split('_')[1] + ",";            
  //   });
  //   console.log(ids.slice(0, ids.length - 1));
  //   var url = '/transformer_informations?' +
  //             'transformer_ids=' + ids;
  //   window.location.replace(url);
  // });
  
  $("#transformers_table").tablesorter(); 
});
