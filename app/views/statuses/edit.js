$("#settings-detail").replaceWith("<%= escape_javascript(render(:partial => 'statuses/form', locals: {status: @status})) %>");
