class Session < ActiveRecord::Base
  belongs_to :user
  attr_accessor :email, :password

  def request=(request)
    self.user_agent = request.user_agent
    self.ip_address = request.remote_ip
  end

  validate do
    if self.user = User.find_by_email(email)
      unless user.authenticate(password)
        errors.add(:password, 'is invalid')
      end
    else
      errors.add(:user, 'is invalid')
    end
  end

end