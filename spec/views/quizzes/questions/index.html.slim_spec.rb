require 'rails_helper'

RSpec.describe "quizzes/questions/index", type: :view do
  before(:each) do
    assign(:quiz, @quiz = create(:quiz))
    assign(:quizzes_questions, [
      @question1 = Quizzes::Question.create!(
        :quiz => @quiz,
        :ordinal => 1,
        :question => "MyText",
        :open_ended => "",
        :answer => "MyText",
        :answer_option_id => 2,
        :answer_template => "MyText"
      ),
      @question2 = Quizzes::Question.create!(
        :quiz => @quiz,
        :ordinal => 1,
        :question => "MyText",
        :open_ended => "",
        :answer => "MyText",
        :answer_option_id => 2,
        :answer_template => "MyText"
      )
    ])
  end

  it "renders a list of quizzes/questions" do
    render
    assert_select "a[href='/quizzes/#{@quiz.id}/questions/new']"
    assert_select "a[href='/quizzes/#{@quiz.id}/questions/#{@question1.id}/edit']"
    assert_select "a[href='/quizzes/#{@quiz.id}/questions/#{@question2.id}/edit']"
    assert_select "a[data-method='delete'][href='/quizzes/#{@quiz.id}/questions/#{@question1.id}']"
    assert_select "a[data-method='delete'][href='/quizzes/#{@quiz.id}/questions/#{@question2.id}']"
  end
end
