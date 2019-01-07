module ApplicationHelper
  def scope_types
    @options = [
      [t(:subscription), 'Subscription'],
      [t(:participation), 'Participation']
    ]
    return @options
  end

  def p_types
    @options = [
      [t(:private), 'Private'],
      [t(:public), 'Public']
    ]
    return @options
  end


end
