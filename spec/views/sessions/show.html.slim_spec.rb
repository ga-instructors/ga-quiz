require 'rails_helper'

RSpec.describe "sessions/show", type: :view do
  before(:each) do
    @session = assign(:session, Session.create!(
      :user => nil,
      :user_agent => "User Agent",
      :ip_address => "Ip Address",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/User Agent/)
    expect(rendered).to match(/Ip Address/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
