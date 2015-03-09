require 'rails_helper'

RSpec.describe "sessions/new", type: :view do
  before(:each) do
    assign(:session, Session.new(
      :user => nil,
      :user_agent => "MyString",
      :ip_address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new session form" do
    render

    assert_select "form[action=?][method=?]", sessions_path, "post" do

      assert_select "input#session_user_id[name=?]", "session[user_id]"

      assert_select "input#session_user_agent[name=?]", "session[user_agent]"

      assert_select "input#session_ip_address[name=?]", "session[ip_address]"

      assert_select "input#session_latitude[name=?]", "session[latitude]"

      assert_select "input#session_longitude[name=?]", "session[longitude]"
    end
  end
end
