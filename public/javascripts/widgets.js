var WIDGETS = {
  transformerNameComboBox: function (id, width) {
    var converted = new Ext.form.ComboBox({
      typeAhead: true,
      triggerAction: 'all',
      transform: id, 
      width: width,
      forceSelection:true
    });
    return converted.el.id;
  }
};


