class GroupMembersMailer < ApplicationMailer

  def invitation(group_member, temporary_password, invitation_blurb)
    @temporary_password = temporary_password
    @invitation_blurb = invitation_blurb
    @group_member = group_member
    @user = @group_member.user
    @group = @group_member.group
    mail to: @group_member.user.email, subject: "You have been invited to join #{@group.name}"
  end

end
