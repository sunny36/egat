$(document).ready(function() {
  var lastsel2; 
  jQuery("#n1_criterias").jqGrid({ 
    url:'/n1_criterias', 
    datatype: "xml", 
    colNames:['Value','Score', 'Score Message'], 
    colModel:[ 
      {name:'value', index:'value', width:170, sortable:false, editable:true}, 
      {name:'score',index:'score', width:50, sortable:false, editable: true}, 
      {name:'score_message', index:'score_message', width:100, 
      sortable:false, editable:true}, 
    ],
    viewrecords: true,
    height: 'auto', 
    caption:"N-1 Criteria", 
    onSelectRow: function(id){ 
      if(id && id!==lastsel2){ 
        jQuery('#n1_criterias').jqGrid('restoreRow', lastsel2); 
        jQuery('#n1_criterias').jqGrid('editRow', id, true);
        lastsel2=id; 
      } 
    },  
    editurl: '/n1_criterias/update'
  });
});
