// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

prettyPrint();

// Setup judge-table for dataTables
$(document).ready(function() {
  $("#judge-table").dataTable({
    "bJQueryUI": true,
    "oLanguage": {
      "sUrl": "/dataTables.spanish.txt"
    }
  });
});

$(function() {
  $(".accordion").accordion({
    collapsible: true,
    active: false,
    fillSpace: false,
    icons: { 'header': 'ui-icon-plus', 'headerSelected': 'ui-icon-minus' },
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
      if ($("#flash > div > p").text() != "") {
        $("#flash").hide('blind', {}, 500)
      }
    }, 10000);
});
