var APP = {
  setupTransformerNameComboxBox: function(id) {
    var transformerId;
    if (jQuery.url.attr("path").split("/")[1] == "transformers" && 
    Number(jQuery.url.attr("path").split("/")[2]) > 0) {
      transformerId = Number(jQuery.url.attr("path").split("/")[2]);
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
      APP.onTransformerNamChange(converted.getValue());    
    });

  },

  onTransformerNamChange: function(transformerId) {
    window.location.href = "/transformers/" + transformerId + "/visual_inspections";
  },

	setupDatePicker: function(id) {
		$(id).datepicker({
	    dateFormat: 'dd/mm/yy',
	    buttonImage: "images/icon_calendar.gif"
	  });	  
	}
};
$(function() {
  if ($('#transformer_id').length > 0) {
    APP.setupTransformerNameComboxBox('transformer_id');
  }

	if ($('#visual_inspection_transformer_id').length > 0) {
    APP.setupTransformerNameComboxBox('visual_inspection_transformer_id');
  }
  
	if ($('#visual_inspection_test_date').length > 0) {
		APP.setupDatePicker('#visual_inspection_test_date');
	}



	$("#tabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix');
	$("#tabs li").removeClass('ui-corner-top').addClass('ui-corner-left');
});
