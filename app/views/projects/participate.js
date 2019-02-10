$("#project-card").replaceWith("<%= escape_javascript(render(:partial => 'projects/project_card', locals: {project: @project})) %>");
new Noty({
    type: 'success',
    theme    : 'relax',
    timeout: 3000,
    layout: 'bottomLeft',
    text: '<%=t :your_request_has_been_processed%>'
}).show();
