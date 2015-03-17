class GroupMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  default_scope -> { order(:role => :desc) }

  # For sending invitations
  attr_accessor :name, :email

  before_create do
    if user
    elsif @email && self.user = User.find_by(email: @email)
    else fail 'TODO: Send Email Invite'
    end
  end
end
