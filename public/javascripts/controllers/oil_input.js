var OilInput = {};

OilInput.setupTransformerNameComboxBox = function(id) {
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
      OilInput.onTransformerNamChange(converted.getValue());    
    });
  }
};

OilInput.onTransformerNamChange = function(transformerId) {
  if ($('body').attr('name') == "new") {
    window.location.href = "/transformers/" + transformerId + 
													 "/visual_inspections/new";
  } else {
    window.location.href = "/transformers/" + transformerId + "/oil_input";
  }
};

OilInput.updateEditAndDeleteLink = function(oilDgaId) {
	var transformerId = jQuery.url.attr("path").split("/")[2];
	var editUrl = "/transformers/" + transformerId + "/oil_dgas/" + oilDgaId + 
						"/edit";
	$("a.edit").attr("href", editUrl);
	var deleteUrl = "/transformers/" + transformerId + "/oil_dgas/" + oilDgaId;
	$("a.delete").attr("href", deleteUrl);
};


$(document).ready(function(){
	OilInput.setupTransformerNameComboxBox('transformer_transformer_id');
	OilInput.setupTransformerNameComboxBox('oil_dga_transformer_id');
	
	$("#main_tank_dga_id").change(function () {
		var oilDgaId = $(this).val()
		OilInput.updateEditAndDeleteLink(oilDgaId);
	});
  
	//   app.setupTransformerNameComboxBox('oil_dga_transformer_id', 200);
	// 
	//   $('#transformer_details').hide();
	//   $('#main_tank_dga').hide();
	// 
	//   $('#ext-gen5').live('blur', function () {
	//     if($(this).attr('value').length > 0) {
	//       var transformerName = $(this).attr('value'); 
	//       $.getJSON('/transformers/show/' + transformerName, function(data) {
	//         var transformer = data;
	//         $('span#transformer_name').text(transformer.transformer_name);
	//         $('span#transformer_equipment_no').text(transformer.egatsn);
	//         $('span#transformer_first_energized').text(transformer.first_energize);
	//         $('span#transformer_manufacture').text(transformer.brand.name);
	//         $('#transformer_details').slideDown();
	//       });
	//       $.getJSON('/transformers/' + transformerName, function(data) {
	//         var transformer = data;
	//         $.getJSON('/transformers/' + transformer.id + '/oil_dgas/graph', function(data) {
	//           var oil_dgas = data;
	//           $('select#main_tank_dga').append($('<option>').text("").val(""));
	//           for (var i = 0; i < oil_dgas.length; i++) {
	//             $('select#main_tank_dga').append($('<option>').text(oil_dgas[i].test_date).val(oil_dgas[i].id));
	//           }
	//           $('#main_tank_dga').slideDown();
	//         });
	//       });
	//     }
	//   });
	// 
	//   $('#main_tank_dga_add').click(function() {
	//     window.location.replace('/oil_dgas/new');
	//   });
	// 
	// $('#main_tank_dga_edit').click(function() {		
	// 	if ($('#main_tank_dga :selected').val().length > 0) {
	// 		var transformerName = $('#ext-gen5').attr('value'); 
	// 		app.getTransformerDetails(transformerName, app.redirectToEditMainTankDga);
	// 	} else {
	// 		alert('Please make a selection.');
	// 	}
	//   });
	// 
	// $('#main_tank_dga_delete').click(function() {
	// 	app.deleteMainTankDga();
	//   });
  
});
