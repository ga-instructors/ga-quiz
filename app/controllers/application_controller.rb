class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pundit

  protect_from_forgery with: :exception
  before_action :require_login

  def require_login
    redirect_to new_session_path unless logged_in?
  end

  def forbidden
    render :forbidden, layout: 'application'
  end

end
