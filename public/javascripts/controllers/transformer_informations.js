jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

$(document).ready(function() {
  $('#transformer_information_bus_voltage_hv_id').change(function () {
    setSystemFaultLevelHvMva(); 
  });

  $('#transformer_information_system_fault_level_hv').blur(function () {
    setSystemFaultLevelHvMva(); 
  });

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

  $('#transformer_information_bus_voltage_lv_id').change(function () {
    setSystemFaultLevelLvMva(); 
  });

  $('#transformer_information_system_fault_level_lv').blur(function () {
    setSystemFaultLevelLvMva(); 
  });

  function setSystemFaultLevelLvMva() {
    var busVoltageLv = parseFloat(
      $('#transformer_information_bus_voltage_lv_id :selected').text()); 
      var systemFaultLevelLv = parseFloat(
        $('#transformer_information_system_fault_level_lv').val());
        if (!isNaN(busVoltageLv) && !isNaN(systemFaultLevelLv)) {
          var systemFaultLevelLvMva = 1.732 * busVoltageLv * systemFaultLevelLv; 
          $('#transformer_information_system_fault_level_lv_mva').
            val(systemFaultLevelLvMva); 
        }
  }

  $("#transformer_information_recorded_date").datepicker({
    showOn: 'both',
    buttonImage: '/images/icon_calendar.gif',
    buttonImageOnly: true,
  });

  (function($) {
    $.widget( "ui.combobox", {
      _create: function() {
        var self = this;
        var select = this.element.hide(),
        selected = select.children(":selected"),
        value = selected.val() ? selected.text() : "";
        var input = $("<input size='12'>").insertAfter(select).val(value).
          autocomplete({
          delay: 0,
          minLength: 0,
          source: function(request, response) {
            var matcher = new RegExp($.ui.autocomplete.
                                     escapeRegex(request.term), "i");
            response(select.children( "option" ).map(function() {
              var text = $(this).text();
              if (this.value && (!request.term || matcher.test(text)))
                return {
                  label: text.
                    replace(new RegExp(
                      "(?![^&;]+;)(?!<[^<>]*)(" + $.ui.autocomplete.
                                              escapeRegex(request.term) +
                                                ")(?![^<>]*>)(?![^&;]+;)", "gi"), 
                  "<strong>$1</strong>"),
                  value: text,
                  option: this
                };
            }));
          },
          select: function( event, ui ) {
            ui.item.option.selected = true;
            select.val(ui.item.option.value );
            self._trigger("selected", event, {
              item: ui.item.option
            });
          },
          change: function( event, ui ) {
            $.get('/transformer_informations/redirect_to_edit_if_exists',
                  {id : $('#transformer_information_transformer_id').val()}, 
                  function (data) {
                    var transformer_information = eval('(' + data + ')');
                    if (transformer_information != null) {
                      window.location.href = 'edit/' + 
                        transformer_information["transformer_information"]["id"];
                    } else {
                      if (!ui.item) {
                        var matcher = new RegExp("^" + $.ui.autocomplete.
                                                 escapeRegex($(this).val() ) + "$", "i"),
                        valid = false;
                        select.children("option").each(function() {
                          if (this.value.match(matcher)) {
                            this.selected = valid = true;
                            return false;
                          }
                        });
                        if (!valid) {
                          // remove invalid value, as it didn't match anything
                          $(this).val("");
                          select.val("");
                        }
                      }
                    }
                  }); 
          }
        }).addClass("ui-widget ui-widget-content ui-corner-left" );

        input.data("autocomplete")._renderItem = function( ul, item ) {
          return $( "<li></li>" ).
            data( "item.autocomplete", item ).
              append( "<a>" + item.label + "</a>" ).
                appendTo( ul );
        };

        $( "<button>&nbsp;</button>" ).
          attr("tabIndex", -1 ).attr( "title", "Show All Items" ).
            insertAfter( input ).button({
          icons: {
            primary: "ui-icon-triangle-1-s"
          },
          text: false
        })
        .removeClass( "ui-corner-all" )
        .addClass( "ui-corner-right ui-button-icon" )
        .click(function() {
          // close if already visible
          if ( input.autocomplete( "widget" ).is( ":visible" ) ) {
            input.autocomplete( "close" );
            return false;
          }

          // pass empty string as value to search for, displaying all results
          input.autocomplete( "search", "" );
          input.focus();
          return false;
        });
      }
    });
  })(jQuery);

  $(function() {
    $("#transformer_information_transformer_id").combobox();
  });

  $(function () {
    $.get('/transformer_informations?q=data_points', function(data) {
      var data_points = eval('(' + data + ')');
      var points = []; 
      var transformer_names = []; 
      for (var i = 0; i < data_points.length; ++i) { 
        points.push([parseFloat(data_points[i][1]), parseFloat(data_points[i][2])]);
        transformer_names.push(data_points[i][0]); 
      }
      var placeholder = $("#placeholder"); 
      var options = {
        series: {lines: { show: false }, points: { show: true }
        },
        grid: { 
          hoverable: true, 
          clickable: true,
          markings: [
            {xaxis: {from: 0, to: 40}, yaxis: {from: 0, to: 40 }, color: 'rgb(146, 208, 80)'}, 
            {xaxis: {from: 40, to: 60}, yaxis: {from: 0, to: 40 }, color: 'rgb(206, 224, 36)'}, 
            {xaxis: {from: 60, to: 100}, yaxis: {from: 0, to: 40 }, color: 'rgb(245, 125, 25)'},
            {xaxis: {from: 0, to: 40}, yaxis: {from: 40, to: 60 }, color: 'rgb(206, 224, 36)'},
            {xaxis: {from: 40, to: 60}, yaxis: {from: 40, to: 60 }, color: 'rgb(255, 255, 0)'},
            {xaxis: {from: 60, to: 100}, yaxis: {from: 40, to: 60 }, color: 'rgb(252, 152, 4)'},
            {xaxis: {from: 0, to: 40}, yaxis: {from: 60, to: 100 }, color: 'rgb(245, 125, 25)'},
            {xaxis: {from: 40, to: 60}, yaxis: {from: 60, to: 100 }, color: 'rgb(252, 152, 4)'},
            {xaxis: {from: 60, to: 100}, yaxis: {from: 60, to: 100 }, color: 'rgb(255, 0, 5)'},
          ]
        },
        yaxis: { min: 0, max: 100, ticks: [0, 40, 60, 100] },
        xaxis: { min: 0, max: 100, ticks: [0, 40, 60, 100] },
      }
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
            showTooltip(item.pageX, item.pageY, 
                        transformer_names[item.dataIndex] + "(" + x + "," + y + ")"); 
          }
        }
        else {
          $("#tooltip").remove();
          previousPoint = null;            
        }
      });

      $("#placeholder").bind("plotclick", function (event, pos, item) {
        if (item) {
          $("#clickdata").text("You clicked point " + item.dataIndex + " in " + transformer_names[item.dataIndex]  + ".");
          plot.highlight(item.series, item.datapoint);
        }
      });

    });
  });

});
