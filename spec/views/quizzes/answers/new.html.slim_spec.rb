require 'rails_helper'

RSpec.describe "quizzes/answers/new", type: :view do
  before(:each) do
    assign(:quizzes_answer, Quizzes::Answer.new(
      :grade => 1.5,
      :reviewer_comment => "MyText"
    ))
  end

  it "renders new quizzes_answer form" do
    render

    assert_select "form[action=?][method=?]", quizzes_answers_path, "post" do

      assert_select "input#quizzes_answer_grade[name=?]", "quizzes_answer[grade]"

      assert_select "textarea#quizzes_answer_reviewer_comment[name=?]", "quizzes_answer[reviewer_comment]"
    end
  end
end
