// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


// Setup judge-table for dataTables
$(document).ready(function() {
  $("#judge-table").dataTable({
    "bJQueryUI": true
  });
});

$(function() {
  $(".accordion").accordion({
    collapsible: true,
    active: false
  });
});

$(function() {
  $(".link").bind('ajax:success', function(e, data, status, xhr) {
    $(".judge-solution-dialog > p").html(data.solution.source_code);
    $(".judge-solution-dialog").dialog({
      modal: true,
      width: 750,
      height: 600
    });
  });
});

   
