$( document ).ready(function() {
  $('#calendar').fullCalendar({
     dayClick: function() {
    alert('a day has been clicked!');
  },
    weekends: false,
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
});})
