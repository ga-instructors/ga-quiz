require 'rails_helper'

RSpec.describe 'Login Specification', type: :feature do
  include FeatureSpec::Screenshots

  before do
    @group = create(:group)
    @user = create(:user)
    @group_member = GroupMember.create(user: @user, group: @group, role: :student)
  end

  specify 'Users can log in and out', js: true do
    visit '/'
    expect(page).to have_css('#new_session')

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    expect(page).to take_screenshot_of('login-form')
    click_button 'Log In'
    expect(page).to take_screenshot_of('login-form2')
    expect(page).to have_content('Hello')

    #find('#auth-section').hover
    #click_link 'Log Out'
    #expect(page).to have_content('logged out')
  end

end
