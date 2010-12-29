var app = {
  setupTransformerNameComboxBox: function (id, width) {
    var widgetsJsUrl = '/javascripts/widgets.js';
    $.getScript(widgetsJsUrl, function () {
      /* TODO Get the newId that is returned */
      WIDGETS.transformerNameComboBox(id, width);
    });
  },

};

$(document).ready(function () {
  app.setupTransformerNameComboxBox('oil_dga_transformer_id', 200);

  $('#ext-gen5').live('blur', function () {
    if($(this).attr('value').length > 0) {
      var transformerName = $(this).attr('value'); 
      $.getJSON('/transformers/show/' + transformerName, function(data) {
        var transformer = data;
        $('span#transformer_name').text(transformer['transformer_name']);
        $('span#transformer_equipment_no').text(transformer['egatsn']);
        $('span#transformer_first_energized')
          .text(transformer['first_energize']);
        $('span#transformer_manufacture').text(transformer['brand']['name']);
      });
    }
  });


});
