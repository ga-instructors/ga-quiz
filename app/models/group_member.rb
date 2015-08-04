class GroupMember < ActiveRecord::Base
  belongs_to :user, inverse_of: :memberships
  belongs_to :group
  default_scope -> { order(:role => :desc) }

  validates :group, presence: true
  validates :user, presence: true, uniqueness: { scope: :group }

  # For sending invitations
  attr_accessor :name, :email, :invitation_blurb

  def role
    self[:role].try(:to_sym)
  end

  before_validation on: :create do
    if user
    else
      temporary_password = SecureRandom.hex(8)
      if @invitation_blurb.present?
        invitation_blurb = @invitation_blurb
      else
        invitation_blurb = "You have been invited to join #{group.name}."
      end
      unless self.user = User.find_by(email: @email)
        self.user = User.create!(
          name: @name, email: @email,
          password: temporary_password, password_confirmation: temporary_password
        )
        GroupMembersMailer.invitation(self, temporary_password, invitation_blurb).deliver_now!
      end
    end
  end

  private

  def sendgrid
    Rails.application.config.sendgrid_client
  end
end
