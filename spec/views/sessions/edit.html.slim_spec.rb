require 'rails_helper'

RSpec.describe "sessions/edit", type: :view do
  before(:each) do
    @session = assign(:session, Session.create!(
      :user => nil,
      :user_agent => "MyString",
      :ip_address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit session form" do
    render

    assert_select "form[action=?][method=?]", session_path(@session), "post" do

      assert_select "input#session_user_id[name=?]", "session[user_id]"

      assert_select "input#session_user_agent[name=?]", "session[user_agent]"

      assert_select "input#session_ip_address[name=?]", "session[ip_address]"

      assert_select "input#session_latitude[name=?]", "session[latitude]"

      assert_select "input#session_longitude[name=?]", "session[longitude]"
    end
  end
end
