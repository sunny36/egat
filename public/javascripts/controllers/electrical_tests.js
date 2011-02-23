ElectricalTest = {};

ElectricalTest.setupTransformerNameComboxBox = function(id) {
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
      ElectricalTest.onTransformerNamChange(converted.getValue());    
    });
  }
};

ElectricalTest.onTransformerNamChange = function(transformerId) {
  if ($('body').attr('name') == "new") {
    window.location.href = "/transformers/" + transformerId + "/electrical_tests/new";
  } else {
    window.location.href = "/transformers/" + transformerId + "/electrical_tests";
  }
};

ElectricalTest.updateEditAndDeleteLink = function(insulatingOilId) {
	var transformerId = jQuery.url.attr("path").split("/")[2];
	var editUrl = "/transformers/" + transformerId + "/insulating_oils/" + 
								insulatingOilId + "/edit";
	$("a.edit").attr("href", editUrl);
	var deleteUrl = "/transformers/" + transformerId + "/insulating_oils/" + 
									insulatingOilId;
	$("a.delete").attr("href", deleteUrl);
};

$(function() {
  ElectricalTest.setupTransformerNameComboxBox('transformer_transformer_id');
	ElectricalTest.setupTransformerNameComboxBox('electrical_test_transformer_id');

	$("#insulating_oil_id").change(function () {
		var insulatingOilId = $(this).val()
		ElectricalTest.updateEditAndDeleteLink(insulatingOilId);
	});
	
});
