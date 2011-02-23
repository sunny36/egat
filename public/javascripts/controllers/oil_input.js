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

OilInput.updateMainTankDgaEditAndDeleteLink = function(oilDgaId) {
	var transformerId = jQuery.url.attr("path").split("/")[2];
	var editUrl = "/transformers/" + transformerId + "/oil_dgas/" + oilDgaId + 
						"/edit";
	$("#main_tank_dga_edit").attr("href", editUrl);
	var deleteUrl = "/transformers/" + transformerId + "/oil_dgas/" + oilDgaId;
	$("#main_tank_dga_delete").attr("href", deleteUrl);
};

OilInput.updateOltcDgaEditAndDeleteLink = function(oltcDgaId) {
	var transformerId = jQuery.url.attr("path").split("/")[2];
	var editUrl = "/transformers/" + transformerId + "/oltc_dgas/" + oltcDgaId + 
						"/edit";
	$("#oltc_dga_edit").attr("href", editUrl);
	var deleteUrl = "/transformers/" + transformerId + "/oltc_dgas/" + oltcDgaId;
	$("#oltc_dga_delete").attr("href", deleteUrl);
};

OilInput.updateFuranEditAndDeleteLink = function(furanId) {
	var transformerId = jQuery.url.attr("path").split("/")[2];
	var editUrl = "/transformers/" + transformerId + "/furans/" + furanId + 
								"/edit";
	$("#furan_edit").attr("href", editUrl);
	var deleteUrl = "/transformers/" + transformerId + "/furans/" + furanId;
	$("#furan_delete").attr("href", deleteUrl);
};

OilInput.updateOilContaminationEditAndDeleteLink = function(oilContaminationId) {
	var transformerId = jQuery.url.attr("path").split("/")[2];
	var editUrl = "/transformers/" + transformerId + "/oil_contaminations/" + 
							  oilContaminationId + "/edit";
	$("#oil_contamination_edit").attr("href", editUrl);
	var deleteUrl = "/transformers/" + transformerId + "/oil_contaminations/" + 
									oilContaminationId;
	$("#oil_contamination_delete").attr("href", deleteUrl);
};

OilInput.updateOltcOilContaminationEditAndDeleteLink = function(oltcOilContaminationId) {
	var transformerId = jQuery.url.attr("path").split("/")[2];
	var editUrl = "/transformers/" + transformerId + "/oltc_oil_contaminations/" + 
							  oltcOilContaminationId + "/edit";
	$("#oltc_oil_contamination_edit").attr("href", editUrl);
	var deleteUrl = "/transformers/" + transformerId + 
									"/oltc_oil_contaminations/" + oltcOilContaminationId;
	$("#oltc_oil_contamination_delete").attr("href", deleteUrl);
};


$(document).ready(function(){
	OilInput.setupTransformerNameComboxBox('transformer_transformer_id');
	OilInput.setupTransformerNameComboxBox('oil_dga_transformer_id');
	
	$("#main_tank_dga_id").change(function () {
		var oilDgaId = $(this).val()
		OilInput.updateMainTankDgaEditAndDeleteLink(oilDgaId);
	});

	$("#oltc_dga_id").change(function () {
		var oltcDgaId = $(this).val()
		OilInput.updateOltcDgaEditAndDeleteLink(oltcDgaId);
	});

  $("#furan_id").change(function () {
		var furanId = $(this).val()
		OilInput.updateFuranEditAndDeleteLink(furanId);
	});

	$("#oil_contamination_id").change(function () {
		var oilContaminationId = $(this).val()
		OilInput.updateOilContaminationEditAndDeleteLink(oilContaminationId);
	});

	$("#oltc_oil_contamination_id").change(function () {
		var oltcOilContaminationId = $(this).val()
		OilInput.updateOltcOilContaminationEditAndDeleteLink(oltcOilContaminationId);
	});
  
});
