$("#advertiser-card").replaceWith("<%= escape_javascript(render(:partial => 'advertisers/advertiser_card', locals: {advertiser: @advertiser})) %>");
new Noty({
    type: 'success',
    theme    : 'relax',
    timeout: 3000,
    layout: 'bottomLeft',
    text: '<%=t :your_request_has_been_processed%>'
}).show();
