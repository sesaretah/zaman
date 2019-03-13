$("#project-box").replaceWith("<%= escape_javascript(render(:partial => 'projects/project_gantt', locals: {project: @project})) %>");
