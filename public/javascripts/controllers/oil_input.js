var app = {
  setupTransformerNameComboxBox: function (id, width) {
    var widgetsJsUrl = '/javascripts/widgets.js';
    $.getScript(widgetsJsUrl, function () {
      /* TODO Get the newId that is returned */
      WIDGETS.transformerNameComboBox(id, width);
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
            $('select#main_tank_dga')
            .append($('<option>').text(oil_dgas[i].test_date).val(oil_dgas[i].id));
          }
          $('#main_tank_dga').slideDown();
        });
      });
    }
  });

  $('#main_tank_dga_add').click(function() {
    window.location.replace('/oil_dgas/new');
  });



});
