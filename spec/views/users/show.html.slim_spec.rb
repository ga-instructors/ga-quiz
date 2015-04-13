require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :email => "Email",
      :password_digest => "Password Digest"
    ))
  end

  it "renders attributes in <p>" do
    render
  end
end
