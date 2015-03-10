require 'rails_helper'

RSpec.describe "quizzes/assessments/edit", type: :view do
  before(:each) do
    @quizzes_assessment = assign(:quizzes_assessment, Quizzes::Assessment.create!(
      :quiz => nil,
      :user => nil,
      :student_comment => "MyText"
    ))
  end

  it "renders the edit quizzes_assessment form" do
    render

    assert_select "form[action=?][method=?]", quizzes_assessment_path(@quizzes_assessment), "post" do

      assert_select "input#quizzes_assessment_quiz_id[name=?]", "quizzes_assessment[quiz_id]"

      assert_select "input#quizzes_assessment_user_id[name=?]", "quizzes_assessment[user_id]"

      assert_select "textarea#quizzes_assessment_student_comment[name=?]", "quizzes_assessment[student_comment]"
    end
  end
end
