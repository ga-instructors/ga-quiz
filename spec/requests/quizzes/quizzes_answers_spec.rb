require 'rails_helper'

RSpec.describe "Quizzes::Answers", type: :request do
  before :all do
    @group, @user = create(:group), create(:user)
    @membership = @user.memberships << @group.group_members.new(role: 'student')
    @session = @user.sessions.create!(password: @user.password)
  end

  describe "GET /quizzes_answers" do
    it "works! (now write some real specs)" do
      post sessions_path, session: { email: @user.email, password: @user.password }
      get quizzes_answers_path
      expect(response).to have_http_status(200)
    end
  end
end
