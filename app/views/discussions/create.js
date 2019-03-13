$("#project-task").replaceWith("<%= escape_javascript(render(:partial => 'tasks/show', locals: { task: @task})) %>");
new Noty({
    type: 'success',
    theme    : 'relax',
    timeout: 2000,
    layout: 'bottomLeft',
    text: '<%=t :successfully_created%>'
}).show();
