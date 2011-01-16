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
    window.location.href = "/transformers/" + transformerId + "/visual_inspection";
  }
};
$(function() {
  if ($('#transformer_id').length > 0) {
    APP.setupTransformerNameComboxBox();
  }

	if ($('#visual_inspection_transformer_id').length > 0) {
    APP.setupTransformerNameComboxBox('visual_inspection_transformer_id');
  }
  


	$("#tabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix');
	$("#tabs li").removeClass('ui-corner-top').addClass('ui-corner-left');
});
