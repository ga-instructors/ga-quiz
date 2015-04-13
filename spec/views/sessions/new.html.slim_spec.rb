require 'rails_helper'

RSpec.describe "sessions/new", type: :view do
  before(:each) do
    assign(:session, Session.new())
  end

  it "renders new session form" do
    render

    assert_select "form[action=?][method=?]", sessions_path, "post" do

      assert_select "input#session_email[name=?]", "session[email]"

      assert_select "input#session_password[name=?]", "session[password]"

    end
  end
end
