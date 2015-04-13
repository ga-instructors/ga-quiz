require 'rails_helper'

RSpec.describe "quizzes/quizzes/edit", type: :view do
  before(:each) do
    @quizzes_quiz = assign(:quizzes_quiz, Quizzes::Quiz.create!(
      :group_id => 1,
      :name => "MyString",
      :introduction => "MyText"
    ))
  end

  it "renders the edit quizzes_quiz form" do
    render

    assert_select "form[action=?][method=?]", quizzes_quiz_path(@quizzes_quiz), "post" do

      assert_select "input#quizzes_quiz_name[name=?]", "quizzes_quiz[name]"

      assert_select "textarea#quizzes_quiz_introduction[name=?]", "quizzes_quiz[introduction]"
    end
  end
end
