require 'rails_helper'

RSpec.describe "quizzes/quizzes/new", type: :view do
  before(:each) do
    assign(:quizzes_quiz, Quizzes::Quiz.new(
      :group_id => 1,
      :name => "MyString",
      :introduction => "MyText"
    ))
  end

  it "renders new quizzes_quiz form" do
    render

    assert_select "form[action=?][method=?]", quizzes_quizzes_path, "post" do

      assert_select "input#quizzes_quiz_group_id[name=?]", "quizzes_quiz[group_id]"

      assert_select "input#quizzes_quiz_name[name=?]", "quizzes_quiz[name]"

      assert_select "textarea#quizzes_quiz_introduction[name=?]", "quizzes_quiz[introduction]"
    end
  end
end
