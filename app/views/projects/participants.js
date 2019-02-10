$("#project-box").replaceWith("<%= escape_javascript(render(:partial => 'projects/project_participants', locals: {participations: @participations, project: @project})) %>");
