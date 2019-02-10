$("#project-card").replaceWith("<%= escape_javascript(render(:partial => 'projects/project_card', locals: {project: @project})) %>");
new Noty({
    type: 'warning',
    theme    : 'relax',
    timeout: 3000,
    layout: 'bottomLeft',
    text: '<%=t :unsubscribed_sucessfully%>'
}).show();
