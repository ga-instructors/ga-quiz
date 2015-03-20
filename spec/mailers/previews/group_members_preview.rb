# Preview all emails at http://localhost:3000/rails/mailers/group_members_mailer
class GroupMembersMailerPreview < ActionMailer::Preview
  def invitation
    GroupMembersMailer.invitation(GroupMember.first, 'temppass')
  end
end
