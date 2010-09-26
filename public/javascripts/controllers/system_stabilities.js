$(document).ready(function() {
  var lastsel2; 
  jQuery("#system_stabilities").jqGrid({ 
    url:'/system_stabilities', 
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
    caption:"System Stability", 
    onSelectRow: function(id){ 
      if(id && id!==lastsel2){ 
        jQuery('#system_stabilities').jqGrid('restoreRow', lastsel2); 
        jQuery('#system_stabilities').jqGrid('editRow', id, true);
        lastsel2=id; 
      } 
    },  
    editurl: '/system_stabilities/update'
  });
});
