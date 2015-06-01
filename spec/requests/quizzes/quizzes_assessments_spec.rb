require 'rails_helper'

RSpec.describe "Quizzes::Assessments", type: :request do

  before :each do
    @group, @user = create(:group), create(:user)
    @membership = @user.memberships << @group.group_members.new(role: 'student')
    @session = @user.sessions.create!(password: @user.password)
    @quiz = create(:quiz, group: @group)
  end

  describe "GET /quizzes/assessments" do
    it "works! (now write some real specs)" do
      post sessions_path, session: { email: @user.email, password: @user.password }
      get quiz_assessments_path(@quiz)
      expect(response).to have_http_status(200)
    end
  end
end
