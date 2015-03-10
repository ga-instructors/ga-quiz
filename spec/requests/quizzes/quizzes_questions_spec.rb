require 'rails_helper'

RSpec.describe "Quizzes::Questions", type: :request do
  describe "GET /quizzes_questions" do
    it "works! (now write some real specs)" do
      get quizzes_questions_path
      expect(response).to have_http_status(200)
    end
  end
end
