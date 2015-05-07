require 'rails_helper'

RSpec.describe "quizzes/quizzes/show", type: :view do
  before(:each) do
    @current_session = assign(:current_session, Session.new(user: build(:user)))
    @quizzes_quiz = assign(:quizzes_quiz, Quizzes::Quiz.new(
      :group => create(:group),
      :name => "Name",
      :introduction => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Start Quiz/)
  end
end
