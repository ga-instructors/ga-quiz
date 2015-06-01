require 'rails_helper'

RSpec.describe "groups/regroups/show", type: :view do
  before(:each) do
    @group = assign(:group, create(:group))
    @groups_regroup = assign(:groups_regroup, Groups::Regroup.create!(
      :group => @group,
      :name => "Name",
      :target_group_size => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
