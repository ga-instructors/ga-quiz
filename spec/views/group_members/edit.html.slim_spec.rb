require 'rails_helper'

RSpec.describe "group_members/edit", type: :view do
  before(:each) do
    @group_member = assign(:group_member, GroupMember.create!(
      :name => "MyString",
      :email => "MyString",
      :role => "MyString"
    ))
  end

  it "renders the edit group_member form" do
    render

    assert_select "form[action=?][method=?]", group_member_path(@group_member), "post" do

      assert_select "input#group_member_name[name=?]", "group_member[name]"

      assert_select "input#group_member_email[name=?]", "group_member[email]"

      assert_select "input#group_member_role[name=?]", "group_member[role]"
    end
  end
end
