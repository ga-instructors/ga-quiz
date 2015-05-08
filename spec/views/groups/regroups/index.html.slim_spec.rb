require 'rails_helper'

RSpec.describe "groups/regroups/index", type: :view do
  before(:each) do
    assign(:groups_regroups, [
      Groups::Regroup.create!(
        :group => nil,
        :name => "Name",
        :target_group_size => 1
      ),
      Groups::Regroup.create!(
        :group => nil,
        :name => "Name",
        :target_group_size => 1
      )
    ])
  end

  it "renders a list of groups/regroups" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
