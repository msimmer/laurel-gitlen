$('body').addClass('sorting')

$('#work-list').sortable
  stop: ( event, ui ) ->
    order = $('#work-list').sortable('toArray', {attribute: 'data-record-id'}).join(',')
    $('#order-field').val(order)

$("<%= j render 'form' %>").insertAfter('.works-order-link')