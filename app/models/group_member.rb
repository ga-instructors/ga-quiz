class GroupMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  default_scope -> { order(:role => :desc) }

  validates :group, presence: true
  validates :user, presence: true

  # For sending invitations
  attr_accessor :name, :email, :invitation_blurb

  after_initialize do
    @invitation_blurb = "You have been invited to join #{group.name}."
  end

  def invitation_blurb=(new_invitation_blurb)
    @invitation_blurb = new_invitation_blurb if new_invitation_blurb.present?
  end

  before_validation on: :create do
    if user
    else
      temporary_password = SecureRandom.hex(8)
      unless self.user = User.find_by(email: @email)
        self.user = User.create!(
          name: @name, email: @email,
          password: temporary_password, password_confirmation: temporary_password
        )
        GroupMembersMailer.invitation(self, temporary_password).deliver_now!
      end
    end
  end

  private
  
  def sendgrid
    Rails.application.config.sendgrid_client
  end
end
