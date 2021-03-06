require 'rails_helper'

RSpec.describe "group_members/index", type: :view do
  before(:each) do
    group = create(:group)
    user1 = create(:user)
    user2 = create(:user)
    assign(:group, group)
    assign(:group_members, [
      GroupMember.create!(
        :group => group,
        :user => user1,
        :role => "Role"
      ),
      GroupMember.create!(
        :group => group,
        :user => user2,
        :role => "Role"
      )
    ])
  end

  it "renders a list of group_members" do
    render
  end
end
