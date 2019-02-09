$("#project-milestone").replaceWith("<%= escape_javascript(render(:partial => 'milestones/list', locals: { project: @project})) %>");
