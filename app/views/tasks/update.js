$("#project-task").replaceWith("<%= escape_javascript(render(:partial => 'tasks/list', locals: { project: @project})) %>");
new Noty({
    type: 'success',
    theme    : 'relax',
    timeout: 2000,
    layout: 'bottomLeft',
    text: '<%=t :successfully_updated%>'
}).show();
