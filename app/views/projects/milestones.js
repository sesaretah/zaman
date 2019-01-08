$("#project-box").replaceWith("<%= escape_javascript(render(:partial => 'projects/project_milestones', locals: {milestone: Milestone.new, project: @project})) %>");
