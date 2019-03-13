$("#project-task").replaceWith("<%= escape_javascript(render(:partial => 'tasks/show', locals: { task: @task})) %>");
