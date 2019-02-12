$("#date-view").replaceWith("<%= escape_javascript(render(:partial => 'calendar/week', locals: {time: @time})) %>");
