$( document ).ready(function() {

  $('#calendar').fullCalendar({
    select: function (start, end, jsEvent, view) {
                    // var newEvent = new Object();
                    var e = document.getElementById("request_room_id");
                    var roomChoice = e.options[e.selectedIndex].text;
                    var roomChoiceId = e.options[e.selectedIndex].value;
                    var trueEnd = moment(end).format();

                    // debugger;

                    if (roomChoice === "") {alert("Please choose a room!")}
                      else
                        {
                        // var title = document.querySelector(".modal-title");
                        var newEvent = new Object();
                        newEvent.start = moment(start).format();
                        newEvent.end = trueEnd;
                        newEvent.title = `${roomChoice} room`;
                        newEvent.allDay = true;
                        $('#calendar').fullCalendar('renderEvent', newEvent);
                        var bookings = $('#calendar').fullCalendar('clientEvents');
                        var lastBooking = bookings[bookings.length - 1];
                        // debugger;
                      var requestAttr = {
                          room_id: roomChoiceId,
                          start_date: lastBooking.start._i,
                          end_date: lastBooking.end.subtract(1, "days").format('DD/MM/YYYY')
                          };
                          // debugger;
                      $.ajax(
                                        {
                                          url: "/requests/new",
                                          type: 'GET',
                                          data: { attributes: JSON.stringify(requestAttr) },
                                          success: function(response){
                                            // $('.modal_partial').replaceWith(response);
                                            $('.modal_partial').html(response);
                                            $('#myModal').modal('show');
                                            // debugger;
                                            // $('.modal_partial').html($(`#myModal`).html());
                                            // $('#myModal').modal('show');
                                            // console.log($('#myModal').html);

                                            // console.log(response);

                                            // $('#myModal').replaceWith(($'#myModal').html(response));
                                            // var result = $('<div />').append(data).find('#showresults').html();
                                            // $('#myModal').html(result);
                                          }

                                        });
                          // $('#myModal').modal('show');
                          // title.innerText = `You are about to book ${roomChoice} room from ${moment(start).format('DD/MM/YYYY')} to ${moment(end.subtract(1, "days")).format('DD/MM/YYYY')}`;

                        };
                      // debugger;
                    // {if (confirm (`confirm these dates? ${moment(start).format('DD/MM/YYYY')} to ${moment(end.subtract(1, "days")).format('DD/MM/YYYY')} in ${roomChoice} room`))
                    //   {
                    //     newEvent.start = moment(start).format(),
                    //     newEvent.end = trueEnd,
                    //     newEvent.title = `${roomChoice} room`,
                    //     newEvent.allDay = true
                    //   };
                    //     $('#calendar').fullCalendar('renderEvent', newEvent)};
                    //     var bookings = $('#calendar').fullCalendar('clientEvents');
                    //     var lastBooking = bookings[bookings.length - 1];
                    //     var lastBookingObject  = {
                    //                               room_id: roomChoiceId,
                    //                               start_date: lastBooking.start._i,
                    //                               end_date: moment(end).format('DD/MM/YYYY')
                    //                               };

                        // debugger;
                        // $('#myModal').modal('show');

                        // $.ajax(
                        //                 {
                        //                   url: "/requests",
                        //                   type: 'POST',
                        //                   data: { eventsJson: JSON.stringify(lastBookingObject) },
                        //                 });
                        // debugger;
                },


    weekends: false,
    selectable: true,
    events: requests

});});


