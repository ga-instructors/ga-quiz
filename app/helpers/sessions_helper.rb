module SessionsHelper

  def current_session
    @current_session ||= Session.find_by_id(session[:id])
  end

  def current_user
    current_session.try(:user)
  end

  def logged_in?
    current_session.present?
  end

  def group_role?(group, *roles)
    roles = roles.to_a
    current_user.memberships.where(group_id: group.try(:[],:id) || group, role: roles).any?
  end

end
