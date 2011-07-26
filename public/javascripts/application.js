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
    active: false,
    fillSpace: false,
    icons: { 'header': 'ui-icon-plus', 'headerSelected': 'ui-icon-minus' }
  });
});

// Open dialog with source code when judge wants to see solution
$(function() {
  $(".link").bind('ajax:success', function(e, data, status, xhr) {
    $("#judge-solution-dialog").dialog({
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
    $(".accordion").accordion("resize");
  });
});

// Auto-hide notifications
$(function() {
    // setTimeout() function will be fired after page is loaded
    // it will wait for 5 sec. and then will fire
    // $("#successMessage").hide() function
    setTimeout(function() {
        $("#flash").hide('blind', {}, 500)
    }, 10000);
});
