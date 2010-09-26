$(document).ready(function() {
  var lastsel2; 
  jQuery("#probability_of_force_outages").jqGrid({ 
    url:'/probability_of_force_outages', 
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
    caption:"Probability of Force Outage", 
    onSelectRow: function(id){ 
      if(id && id!==lastsel2){ 
        jQuery('#probability_of_force_outages').jqGrid('restoreRow', lastsel2); 
        jQuery('#probability_of_force_outages').jqGrid('editRow', id, true);
        lastsel2=id; 
      } 
    },  
    editurl: '/probability_of_force_outages/update'
  });
});
