require 'rails_helper'

RSpec.describe "quizzes/answers/show", type: :view do
  before(:each) do
    @assessment = create(:quiz_assessment)
    @question = create(:quiz_question, quiz: @assessment.quiz)
    @quizzes_answer = assign(:quizzes_answer, @assessment.answers.create!(
      :question => @question,
      :grade => 1.5,
      :reviewer_comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/MyText/)
  end
end
