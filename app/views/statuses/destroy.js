$("#settings-detail").replaceWith("<%= escape_javascript(render(:partial => 'statuses/form', locals: {status: Status.new})) %>");
new Noty({
    type: 'error',
    theme    : 'relax',
    timeout: 3000,
    layout: 'bottomLeft',
    text: '<%=t :successfully_destroyed%>'
}).show();
