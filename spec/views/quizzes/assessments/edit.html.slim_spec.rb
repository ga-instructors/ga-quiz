require 'rails_helper'

RSpec.describe "quizzes/assessments/edit", type: :view do
  before(:each) do
    @assessment = @quizzes_assessment = assign(:quizzes_assessment, Quizzes::Assessment.create!(
      :quiz => create(:quiz),
      :user => create(:user),
      :student_comment => "MyText"
    ))
  end

  it "renders the edit quizzes_assessment form" do
    render

    assert_select "form[action=?][method=?]", quizzes_assessment_path(@quizzes_assessment), "post" do

      assert_select "textarea#quizzes_assessment_student_comment[name=?]", "quizzes_assessment[student_comment]"
    end
  end
end
