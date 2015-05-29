require 'rails_helper'

RSpec.describe "quizzes/questions/show", type: :view do
  before(:each) do
    @quiz = assign(:quiz, create(:quiz))
  end

  it "renders for open ended questions" do
    @quizzes_question = assign(:quizzes_question, Quizzes::Question.create!(
      :quiz => @quiz,
      :ordinal => 1,
      :question => "Question Text",
      :open_ended => true,
      :answer => "Answer Key"
    ))
    render
    expect(rendered).to match(/Question Text/)
    expect(rendered).to match(/Answer Key/)
  end

  it "renders for a multiple choice question" do
    @question_option = Quizzes::Question::Option.create(label: 'Option1')
    @quizzes_question = assign(:quizzes_question, Quizzes::Question.create!(
      :quiz => @quiz,
      :ordinal => 1,
      :question => "Question Text",
      :open_ended => false,
      :answer_option => @question_option
    ))
    render
    expect(rendered).to match(/Question Text/)
    expect(rendered).to match(/Option1/)
  end
end
