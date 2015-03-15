require 'rails_helper'

RSpec.describe "quizzes/answers/edit", type: :view do
  before(:each) do
    @quizzes_answer = assign(:quizzes_answer, Quizzes::Answer.create!(
      :grade => 1.5,
      :reviewer_comment => "MyText"
    ))
  end

  it "renders the edit quizzes_answer form" do
    render

    assert_select "form[action=?][method=?]", quizzes_answer_path(@quizzes_answer), "post" do

      assert_select "input#quizzes_answer_grade[name=?]", "quizzes_answer[grade]"

      assert_select "textarea#quizzes_answer_reviewer_comment[name=?]", "quizzes_answer[reviewer_comment]"
    end
  end
end
