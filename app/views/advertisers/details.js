$("#advertiser-box").replaceWith("<%= escape_javascript(render(:partial => 'advertisers/advertiser_details', locals: {advertiser: @advertiser})) %>");
