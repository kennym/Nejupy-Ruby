// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Show solution form  
$(function() {
  $(".create-solution").click(function() {
    // Unhide .create-solution-form for current problem
  })
})

// Setup judge-table for dataTables
$(document).ready(function() {
  $("#judge-table").dataTable({
    "bJQueryUI": true,
  });
});
