class Session < ActiveRecord::Base
  belongs_to :user
  attr_accessor :email, :password
  after_create :clear_old_sessions

  def request=(request)
    self.user_agent = request.user_agent
    self.ip_address = request.remote_ip
  end

  def previous
    Session.where('sessions.created_at < ?', created_at).order(:created_at => :desc).first
  end

  validate do
    if self.user ||= User.find_by_email(email)
      unless user.authenticate(password)
        errors.add(:password, 'is invalid')
      end
    else
      errors.add(:user, 'is invalid')
    end
  end

  private

  def clear_old_sessions
    user.sessions.where('created_at < ?', 3.month.ago).destroy_all if user.sessions.count > 10
  end

end
