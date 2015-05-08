require 'rails_helper'

RSpec.describe "groups/regroups/new", type: :view do
  before(:each) do
    assign(:groups_regroup, Groups::Regroup.new(
      :group => nil,
      :name => "MyString",
      :target_group_size => 1
    ))
  end

  it "renders new groups_regroup form" do
    render

    assert_select "form[action=?][method=?]", groups_regroups_path, "post" do

      assert_select "input#groups_regroup_group_id[name=?]", "groups_regroup[group_id]"

      assert_select "input#groups_regroup_name[name=?]", "groups_regroup[name]"

      assert_select "input#groups_regroup_target_group_size[name=?]", "groups_regroup[target_group_size]"
    end
  end
end
