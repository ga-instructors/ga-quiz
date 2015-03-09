module ApplicationHelper

  def notice
    content_tag(:div, super, class: 'alert-box row', data: { alert: true }) if super
  end

end
