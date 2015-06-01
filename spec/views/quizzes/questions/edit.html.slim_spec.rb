require 'rails_helper'

RSpec.describe "quizzes/questions/edit", type: :view do
  before(:each) do
    @quiz = create(:quiz)
    @quizzes_question = assign(:quizzes_question, Quizzes::Question.create!(
      :quiz => @quiz,
      :ordinal => 1,
      :question => "MyText",
      :open_ended => "",
      :answer => "MyText",
      :answer_option_id => 1,
      :answer_template => "MyText"
    ))
    @quizzes_question.options.create!(label: 'Option A')
  end

  it "renders the edit quizzes_question form" do
    render

    assert_select "form[action=?][method=?]", quizzes_question_path(@quizzes_question), "post" do

      assert_select "input#quizzes_question_quiz_id[name=?]", "quizzes_question[quiz_id]"

      assert_select "input#quizzes_question_ordinal[name=?]", "quizzes_question[ordinal]"

      assert_select "textarea#quizzes_question_question[name=?]", "quizzes_question[question]"

      assert_select "input#quizzes_question_open_ended_true[name=?]", "quizzes_question[open_ended]"
      assert_select "input#quizzes_question_open_ended_false[name=?]", "quizzes_question[open_ended]"

      assert_select "textarea#quizzes_question_answer[name=?]", "quizzes_question[answer]"

      assert_select "input[name=?]", "quizzes_question[answer_option_id]"

      assert_select "textarea#quizzes_question_answer_template[name=?]", "quizzes_question[answer_template]"
    end
  end
end
