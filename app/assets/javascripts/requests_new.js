$( document ).ready(function() {
  $('#calendar').fullCalendar({
  //    dayClick: function() {
  //   alert('a day has been clicked!');
  // },
    select: function (start, end, jsEvent, view) {
                    // var abc = prompt('Enter Title');
                    // var allDay = !start.hasTime && !end.hasTime;
                    var newEvent = new Object();
                    // newEvent.title = abc;
                    var e = document.getElementById("request_room_id");
                    var userChoice = e.options[e.selectedIndex].text;
                    var trueEnd = moment(end).format();


                    if (userChoice === "") {alert("Please choose a room!")}
                      else
                    {if (confirm (`confirm these dates? ${moment(start).format('DD/MM/YYYY')} to ${moment(end.subtract(1, "days")).format('DD/MM/YYYY')} in ${userChoice} room`))
                      {
                        newEvent.start = moment(start).format(),
                        newEvent.end = trueEnd,
                        newEvent.title = `${userChoice} room`,
                        newEvent.allDay = true
                      };
                        $('#calendar').fullCalendar('renderEvent', newEvent)};
                        // debugger
                    // var bookings = $('#calendar').fullCalendar('clientEvents');
                    // var lastBooking = bookings[bookings.length - 1];

                    // var lastBookingObject  =
                    // {
                    //   start_date: lastBooking.start._i,
                    //   end_date: lastBooking.end._i
                    // };

                    // confirm($.ajax(
                    //                     {
                    //                       url: "/requests",
                    //                       type: 'POST',
                    //                       data: { eventsJson: JSON.stringify(lastBookingObject) },
                    //                     }));
                },

    //     function () {
    //     $("#save").click(function () {
    //         var eventsFromCalendar = $('#calendar').fullCalendar('clientEvents');
    //         debugger;
    //         $.ajax(
    //     {

    //         url: "/requests",
    //         type: 'POST',
    //         traditional: true,
    //         data: { eventsJson: JSON.stringify(eventsFromCalendar) },
    //         dataType: "json",
    //         success: function (response) {
    //             alert(response);
    //         },
    //         error: function (xhr) {
    //             debugger;
    //             alert(xhr);
    //         }

    //     });
    //     });
    // },

    weekends: false,
    selectable: true,
    events: requests
    // events: [
    //           {
    //               title: 'red room',
    //               start: '2019-06-17',
    //               end: '2019-06-21'
    //           },
    //           {
    //               title: 'yellow room',
    //               start: '2019-06-03',
    //               end: '2019-06-07'
    //           }
    //       ]
});});


