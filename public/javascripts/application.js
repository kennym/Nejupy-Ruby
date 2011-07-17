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
