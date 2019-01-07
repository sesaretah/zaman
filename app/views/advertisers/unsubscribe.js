$("#advertiser-card").replaceWith("<%= escape_javascript(render(:partial => 'advertisers/advertiser_card', locals: {advertiser: @advertiser})) %>");
new Noty({
    type: 'warning',
    theme    : 'relax',
    timeout: 3000,
    layout: 'bottomLeft',
    text: '<%=t :unsubscribed_sucessfully%>'
}).show();
