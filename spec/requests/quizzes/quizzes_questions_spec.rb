require 'rails_helper'

RSpec.describe "Quizzes::Questions", type: :request do
  
  before :each do
    @group, @user = create(:group), create(:user)
    @membership = @user.memberships << @group.group_members.new(role: 'student')
  end

  describe "GET /quizzes_questions" do
    it "works! (now write some real specs)" do
      @quiz = create(:quiz)
      post sessions_path, session: { email: @user.email, password: @user.password }
      get quiz_questions_path(@quiz)
      expect(response).to have_http_status(200)
    end
  end
end
