require 'rails_helper'

RSpec.describe "quizzes/assessments/new", type: :view do
  before(:each) do
    assign(:quizzes_assessment, Quizzes::Assessment.new(
      :quiz => nil,
      :user => nil,
      :student_comment => "MyText"
    ))
  end

  it "renders new quizzes_assessment form" do
    render

    assert_select "form[action=?][method=?]", quizzes_assessments_path, "post" do

      assert_select "input#quizzes_assessment_quiz_id[name=?]", "quizzes_assessment[quiz_id]"

      assert_select "input#quizzes_assessment_user_id[name=?]", "quizzes_assessment[user_id]"

      assert_select "textarea#quizzes_assessment_student_comment[name=?]", "quizzes_assessment[student_comment]"
    end
  end
end
