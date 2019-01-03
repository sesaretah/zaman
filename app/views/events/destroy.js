$('#event_modal').modal('hide');
$('body').removeClass('modal-open');
$('.modal-backdrop').remove();
$("#date-view").replaceWith("<%= escape_javascript(render(:partial => 'calendar/day', locals: {time: @time})) %>");
