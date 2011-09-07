var Arrester = {};  

Arrester.setupTransformerNameComboxBox = function(id) {
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

    converted.on('select', function() { Arrester.onTransformerNamChange(converted.getValue()); });
  }
};

Arrester.onTransformerNamChange = function(transformerId) {
  if ($('body').attr('name') == "new") {
    window.location.href = "/transformers/" + transformerId + "/arresters/new";
  } else {
    window.location.href = "/transformers/" + transformerId +  "/arresters";
  }
};

Arrester.setupDatePicker = function(id) {
  $(id).datepicker({dateFormat: 'dd/mm/yy', buttonImage: "images/icon_calendar.gif"});
};






$(function() {
  if ($('#arrester_test_date').length > 0) {
    Arrester.setupDatePicker('#arrester_test_date');
  }

  Arrester.setupTransformerNameComboxBox('arrester_transformer_id');
  
});
