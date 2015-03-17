class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper
  before_action :require_login

  def require_login
    redirect_to new_session_path unless logged_in?
  end

  def group_role?(group, *roles)
    roles = roles.to_a
    current_user.memberships.where(group_id: group.try(:[],:id) || group, role: roles).any?
  end

  def forbidden
    render :forbidden, layout: 'application'
  end

end
