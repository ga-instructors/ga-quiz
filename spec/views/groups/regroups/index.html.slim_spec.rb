require 'rails_helper'

RSpec.describe "groups/regroups/index", type: :view do
  before(:each) do
    @group = assign(:group, create(:group))
    assign(:groups_regroups, [
      Groups::Regroup.create!(
        :group => @group,
        :name => "Regroup1",
        :target_group_size => 1
      ),
      Groups::Regroup.create!(
        :group => @group,
        :name => "Regroup2",
        :target_group_size => 2
      )
    ])
  end

  it "renders a list of groups/regroups" do
    render
    expect(rendered).to include("Regroup1")
    expect(rendered).to include("Regroup2")
  end
end
