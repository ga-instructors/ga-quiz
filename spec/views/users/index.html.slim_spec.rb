require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.new(
        :id => 1,
        :name => "name1",
        :email => "email1@host.com",
        :password_digest => "Password Digest"
      ),
      User.new(
        :id => 2,
        :name => "name2",
        :email => "email2@host.com",
        :password_digest => "Password Digest"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "name1".to_s, :count => 1
    assert_select "tr>td", :text => "name2".to_s, :count => 1
    assert_select "tr>td", :text => "email1@host.com".to_s, :count => 1
    assert_select "tr>td", :text => "email2@host.com".to_s, :count => 1
  end
end
