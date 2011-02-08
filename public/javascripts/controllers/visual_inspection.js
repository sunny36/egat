var VisualInspection = { };

VisualInspection.setupTransformerNameComboxBox = function(id) {
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
      VisualInspection.onTransformerNamChange(converted.getValue());    
    });
  }
};

VisualInspection.onTransformerNamChange = function(transformerId) {
  if ($('body').attr('name') == "new") {
    window.location.href = "/transformers/" + transformerId + "/visual_inspections/new";
  } else {
    window.location.href = "/transformers/" + transformerId + "/visual_inspections";
  }
};

VisualInspection.setupDatePicker = function(id) {
  $(id).datepicker({
    dateFormat: 'dd/mm/yy',
    buttonImage: "images/icon_calendar.gif"
  });	  
};

VisualInspection.showFirstTabContainingErrors = function() {
  if ($('#general_condition').find('.field_with_errors').length > 0) {
    $("#tabs").tabs("option", "selected", 0);
  } else if ($('#bushing_condition').find('.field_with_errors').length > 0) {
    $("#tabs").tabs("option", "selected", 1);
  }
};

VisualInspection.onNextClicked = function(tabName) {
  $('button.next').click(function () {
    var selected = $("#tabs").tabs("option", "selected");
    $("#tabs").tabs({ selected: selected + 1});				
    return false;			
  });
};

VisualInspection.onPreviousClicked = function(tabName) {
  $('button.previous').click(function () {
    var selected = $("#tabs").tabs("option", "selected");
    $("#tabs").tabs({ selected: selected - 1});				
    return false;			
  });
};

$(function() {
  VisualInspection.setupTransformerNameComboxBox('transformer_id');
  VisualInspection
  .setupTransformerNameComboxBox('visual_inspection_transformer_id');

  if ($('#visual_inspection_test_date').length > 0) {
    VisualInspection.setupDatePicker('#visual_inspection_test_date');
  }

  $("#tabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix');
  $("#tabs li").removeClass('ui-corner-top').addClass('ui-corner-left');

  if ($('#errorExplanation').length > 0) {
    VisualInspection.showFirstTabContainingErrors();
  }

  if ($('button.next').length > 0) {
    VisualInspection.onNextClicked();		
  }
  if ($('button.previous').length > 0) {
    VisualInspection.onPreviousClicked();		
  }
});
