$(document).ready(function() {
  var lastsel2; 
  jQuery("#social_aspects").jqGrid({ 
    url:'/social_aspects', 
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
    caption:"Social Aspect", 
    onSelectRow: function(id){ 
      if(id && id!==lastsel2){ 
        jQuery('#social_aspects').jqGrid('restoreRow', lastsel2); 
        jQuery('#social_aspects').jqGrid('editRow', id, true);
        lastsel2=id; 
      } 
    },  
    editurl: '/social_aspects/update'
  });
});
