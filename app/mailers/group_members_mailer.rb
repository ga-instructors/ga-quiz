class GroupMembersMailer < ApplicationMailer

  def invitation(group_member, temporary_password)
    @temporary_password = temporary_password
    @group_member = group_member
    @user = @group_member.user
    @group = @group_member.group
    mail to: @group_member.user.email, subject: 'GA-QUIZ'
  end

end
