$(document).ready(function(){
  function getReservations() {
    $.ajax({
      url: window.location.pathname,
      success: function(data) {
        console.log('success');
      },
      complete: function() {
        if(window.location.pathname.includes('seats'))
          setTimeout(getReservations, 20000);
      }
    })
  }

  setTimeout(getReservations, 20000);
})

$('#confirm-seat').on('click', function(event) {
  event.preventDefault();

  let seats = []
  $('.active input').each(function(index, elem){
    seats.push(elem.value)
  })

  if(seats.length === 0) {
    alert('You need to select at least one seat')
    return
  }

  if(confirm('Are you sure to book the seats?')) {
    $.ajax({
      url: '/bookings',
      method: 'POST',
      data: {
        seat_ids: seats,
        show_id: $(this).data('show-id'),
        authenticity_token: window.authenticity_token
      },
      success: function(data) {
        console.log('success');
      },
      failure: function() {
        console.log('failure');
      }
    })
  }
})