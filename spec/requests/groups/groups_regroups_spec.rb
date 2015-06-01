require 'rails_helper'

RSpec.describe "Groups::Regroups", type: :request do

  before :each do
    @group, @user = create(:group), create(:user)
    @membership = @user.memberships << @group.group_members.new(role: 'student')
  end

  describe "GET /groups_regroups" do
    it "works! (now write some real specs)" do
      post sessions_path, session: { email: @user.email, password: @user.password }
      get group_regroups_path(@group)
      expect(response).to have_http_status(200)
    end
  end
end
