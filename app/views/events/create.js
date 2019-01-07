<% if @spearding.blank? %>
$('#event_modal').modal('hide');
$('body').removeClass('modal-open');
$('.modal-backdrop').remove();
$("#date-view").replaceWith("<%= escape_javascript(render(:partial => 'calendar/day', locals: {time: @time})) %>");
<%end%>
<% if !@spearding.blank? %>
$("#advertiser-box").replaceWith("<%= escape_javascript(render(:partial => 'advertisers/advertiser_events', locals: {advertiser: @item})) %>");
<%end%>
