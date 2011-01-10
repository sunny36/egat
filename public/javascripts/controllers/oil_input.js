var app = {
  setupTransformerNameComboxBox: function (id, width) {
    var widgetsJsUrl = '/javascripts/widgets.js';
    $.getScript(widgetsJsUrl, function () {
      /* TODO Get the newId that is returned */
      WIDGETS.transformerNameComboBox(id, width);
    });
  },

	getTransformerDetails: function(transformerName, callback) {
		$.getJSON('/transformers/' + transformerName, function(data) {
			var transformer = data;
			callback(transformer.id)
		});
	},
	
	redirectToEditMainTankDga: function(transformerId) {
		var oilDgaId = $('#main_tank_dga :selected').val();
		window.location.replace(
			'/transformers/' + transformerId + '/oil_dgas/' + oilDgaId + '/edit');
	},
	
	deleteMainTankDga: function() {
		if ($('#main_tank_dga :selected').val().length > 0) { 
			var oilDgaDate = $('#main_tank_dga :selected').text();
			var transformerName = $('#ext-gen5').attr('value'); 
	    var message = 
				'Are you sure you want to delete the Main Tank DGA entry on ' + 
				oilDgaDate + ' for ' + transformerName + '?';
			if (confirm(message))	{
				app.getTransformerDetails(transformerName, app.ajaxRequestDeleteOilDga);
			}	else {
				return;
			}										
		} else {
			alert('Please make a selection.');
			return;			
		}					
	},
	
	ajaxRequestDeleteOilDga: function(transformerId) {
		var oilDgaId = $('#main_tank_dga :selected').val();
		$.ajax({
			type: 'DELETE',
			url: '/transformers/' + transformerId + '/oil_dgas/' + oilDgaId,
			data: {
				authenticity_token: $('meta[name=csrf-token]').attr('content')
			},
			dataType: 'json',
			success: function(data) {
				var oilDgas = data;
				$("select#main_tank_dga option[value='" + oilDgaId + "']").remove();
				$("select#main_tank_dga").val("");
			}
		});					
	}
};

$(document).ready(function(){
  app.setupTransformerNameComboxBox('oil_dga_transformer_id', 200);

  $('#transformer_details').hide();
  $('#main_tank_dga').hide();

  $('#ext-gen5').live('blur', function () {
    if($(this).attr('value').length > 0) {
      var transformerName = $(this).attr('value'); 
      $.getJSON('/transformers/show/' + transformerName, function(data) {
        var transformer = data;
        $('span#transformer_name').text(transformer.transformer_name);
        $('span#transformer_equipment_no').text(transformer.egatsn);
        $('span#transformer_first_energized').text(transformer.first_energize);
        $('span#transformer_manufacture').text(transformer.brand.name);
        $('#transformer_details').slideDown();
      });
      $.getJSON('/transformers/' + transformerName, function(data) {
        var transformer = data;
        $.getJSON('/transformers/' + transformer.id + '/oil_dgas/graph', function(data) {
          var oil_dgas = data;
          $('select#main_tank_dga').append($('<option>').text("").val(""));
          for (var i = 0; i < oil_dgas.length; i++) {
            $('select#main_tank_dga').append($('<option>').text(oil_dgas[i].test_date).val(oil_dgas[i].id));
          }
          $('#main_tank_dga').slideDown();
        });
      });
    }
  });

  $('#main_tank_dga_add').click(function() {
    window.location.replace('/oil_dgas/new');
  });

	$('#main_tank_dga_edit').click(function() {		
		if ($('#main_tank_dga :selected').val().length > 0) {
			var transformerName = $('#ext-gen5').attr('value'); 
			app.getTransformerDetails(transformerName, app.redirectToEditMainTankDga);
		} else {
			alert('Please make a selection.');
		}
  });

	$('#main_tank_dga_delete').click(function() {
		app.deleteMainTankDga();
  });
  
});
