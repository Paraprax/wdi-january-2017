// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {

  $('#new_greeting').submit(function(event) {
    event.preventDefault();
    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize(),
      dataType: 'json'
    }).done(function(responseData) {
      console.log('came back successfully');
      console.log(responseData);


      // var listElement = "<li>" + responseData + "</li>";
      // var listElement = $('<li>', {
      //   text: responseData.note + ", created at: " + responseData.created_at,
      // });
      // $("#greeting-list").prepend(listElement);

      $("#greeting-list").prepend(responseData);

    }).fail(function() {
      console.log('failed');
    }).always(function() {
      console.log('came back (period)');
    });
  });

});
