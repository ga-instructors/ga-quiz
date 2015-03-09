require 'rails_helper'

RSpec.describe "sessions/index", type: :view do
  before(:each) do
    assign(:sessions, [
      Session.create!(
        :user => nil,
        :user_agent => "User Agent",
        :ip_address => "Ip Address",
        :latitude => 1.5,
        :longitude => 1.5
      ),
      Session.create!(
        :user => nil,
        :user_agent => "User Agent",
        :ip_address => "Ip Address",
        :latitude => 1.5,
        :longitude => 1.5
      )
    ])
  end

  it "renders a list of sessions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "User Agent".to_s, :count => 2
    assert_select "tr>td", :text => "Ip Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
