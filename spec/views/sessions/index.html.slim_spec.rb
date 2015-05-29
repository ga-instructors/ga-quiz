require 'rails_helper'

RSpec.describe "sessions/index", type: :view do
  before(:each) do
    @user = assign(:user, build(:user))
    assign(:sessions, [
      Session.new(
        :user => @user,
        :user_agent => "User Agent",
        :ip_address => "Ip Address",
        :latitude => 1.5,
        :longitude => 2.5
      ),
      Session.new(
        :user => @user,
        :user_agent => "User Agent",
        :ip_address => "Ip Address",
        :latitude => 3.5,
        :longitude => 4.5
      )
    ])
  end

  it "renders a list of sessions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "User Agent".to_s, :count => 2
    assert_select "tr>td", :text => "Ip Address".to_s, :count => 2
  end
end
