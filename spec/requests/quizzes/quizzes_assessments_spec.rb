require 'rails_helper'

RSpec.describe "Quizzes::Assessments", type: :request do
  describe "GET /quizzes_assessments" do
    it "works! (now write some real specs)" do
      get quizzes_assessments_path
      expect(response).to have_http_status(200)
    end
  end
end
