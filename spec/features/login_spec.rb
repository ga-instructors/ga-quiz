require 'rails_helper'

RSpec.describe 'Login Specification', type: :feature do

  before do
    @user = create(:user)
  end

  specify 'Users can log in and out', js: true do
    visit '/'
    expect(page).to have_css('#new_session')

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'
    expect(page.status_code).to be 200

    find('#auth-section').hover
    click_link 'Log Out'
    expect(page.status_code).to be 200
    expect(page).to have_content('logged out')
  end

end
