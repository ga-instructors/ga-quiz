require 'rails_helper'

RSpec.describe "group_members/new", type: :view do
  before(:each) do
    @group = assign(:group, create(:group))
    assign(:group_member, GroupMember.new(
      :group => @group,
      :name => "MyString",
      :email => "MyString",
      :role => "MyString"
    ))
  end

  it "renders new group_member form" do
    render

    assert_select "form[action=?][method=?]", group_members_path, "post" do

      assert_select "input#group_member_name[name=?]", "group_member[name]"

      assert_select "input#group_member_email[name=?]", "group_member[email]"

      assert_select "select#group_member_role[name=?]", "group_member[role]"
    end
  end
end
