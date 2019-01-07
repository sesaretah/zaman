$("#settings-detail").replaceWith("<%= escape_javascript(render(:partial => 'statuses/form', locals: {status: @status})) %>");
<% if !@status.errors.blank?%>
new Noty({
    type: 'error',
    theme    : 'relax',
    timeout: 3000,
    layout: 'bottomLeft',
    text: '<%=t @status.errors.full_messages%>'
}).show();
<%end%>
