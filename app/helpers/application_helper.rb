module ApplicationHelper

  def notice
    content_tag(:div, super, class: 'alert-box row', data: { alert: true }) if super
  end

  def gravatar_url(email, size: 48, default: 'retro')
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{default}"
  end

end
