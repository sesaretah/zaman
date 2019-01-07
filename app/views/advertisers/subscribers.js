$("#advertiser-box").replaceWith("<%= escape_javascript(render(:partial => 'advertisers/advertiser_subscribers', locals: {subscriptions: @subscriptions, advertiser: @advertiser})) %>");
