$("#project-task").replaceWith("<%= escape_javascript(render(:partial => 'tasks/form', locals: {task: @task, project: @project})) %>");
