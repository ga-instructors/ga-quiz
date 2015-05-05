require 'rails_helper'

RSpec.describe "GroupMembers", type: :request do
  before :all do
    @group, @user = create(:group), create(:user)
    @membership = @user.memberships << @group.group_members.new(role: 'student')
  end

  describe "GET /group_members" do
    it "works! (now write some real specs)" do
      post sessions_path, session: { email: @user.email, password: @user.password }
      get group_members_path
      expect(response).to have_http_status(200)
    end
  end
end
