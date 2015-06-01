require 'rails_helper'

RSpec.describe "group_members/show", type: :view do
  before(:each) do
    @group = assign(:group, create(:group))
    @session = assign(:current_session, create(:session))
    @user = @session.user
    @group_member = assign(:group_member, GroupMember.create!(
      :group => @group,
      :user => @user,
      :name => "Name",
      :email => "Email",
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Role/)
  end
end
