$("#advertiser-box").replaceWith("<%= escape_javascript(render(:partial => 'advertisers/advertiser_events', locals: {advertiser: @advertiser})) %>");
