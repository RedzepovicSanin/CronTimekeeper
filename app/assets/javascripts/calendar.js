$(function() {
  var url = $('.js-fetch-events').val();
  var generator = $('.js-create-events');

  $('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    defaultView: 'agendaWeek',
    allDay: false,
    minTime: "08:00:00",
    maxTime: "19:00:00",
    events: {
      url: url,
      type: 'GET',
      contentType: "application/json" ,
      error: function() {
        alert('Something wrong with fetching events!');
      }
    }
  });

  // if button is clicked, post events
  generator.click(function(e) {
    e.preventDefault();
    btn = $(e.target);
    $.ajax({
      type: 'POST',
      url: btn.data('url'),
      dataType: 'json',
      data: btn.data('data'),
      success: function() {
        $('#calendar').fullCalendar('refetchEvents');
      },
      error: function() {
        alert('warning');
      }
    });
  })
});