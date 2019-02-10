$("#project-milestone").replaceWith("<%= escape_javascript(render(:partial => 'milestones/form', locals: {milestone: @milestone, project: @project})) %>");
