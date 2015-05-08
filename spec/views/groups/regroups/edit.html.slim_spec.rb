require 'rails_helper'

RSpec.describe "groups/regroups/edit", type: :view do
  before(:each) do
    @groups_regroup = assign(:groups_regroup, Groups::Regroup.create!(
      :group => nil,
      :name => "MyString",
      :target_group_size => 1
    ))
  end

  it "renders the edit groups_regroup form" do
    render

    assert_select "form[action=?][method=?]", groups_regroup_path(@groups_regroup), "post" do

      assert_select "input#groups_regroup_group_id[name=?]", "groups_regroup[group_id]"

      assert_select "input#groups_regroup_name[name=?]", "groups_regroup[name]"

      assert_select "input#groups_regroup_target_group_size[name=?]", "groups_regroup[target_group_size]"
    end
  end
end
