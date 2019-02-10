<% if @status.errors.blank?%>
$("#settings-detail").replaceWith("<%= escape_javascript(render(:partial => 'statuses/form', locals: {status: Status.new})) %>");
new Noty({
    type: 'success',
    theme    : 'relax',
    timeout: 3000,
    layout: 'bottomLeft',
    text: '<%=t :successfully_created%>'
}).show();
<%end%>
<% if !@status.errors.blank?%>
$("#settings-detail").replaceWith("<%= escape_javascript(render(:partial => 'statuses/form', locals: {status: @status})) %>");
new Noty({
    type: 'error',
    theme    : 'relax',
    timeout: 3000,
    layout: 'bottomLeft',
    text: '<%=t @status.errors.full_messages%>'
}).show();
<%end%>
