// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


prettyPrint();

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

// Open dialog with source code when judge wants to see solution
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

// Contestant's edit solution
$(function() {
  $(".contestant-edit-solution").bind('ajax:success', function(e, data, status, xhr) {
    // Replace the source code and edit link with the edit form.
    var problem_id = $(this).attr("data-problem-id");
    // Parse the form from the response
    var form = $(xhr.responseText).find('.update-solution-form');
    $(".show-solution[id="+ problem_id + "]").replaceWith(form);
  });
});
