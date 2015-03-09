require 'rails_helper'

RSpec.describe "quizzes/quizzes/show", type: :view do
  before(:each) do
    @quizzes_quiz = assign(:quizzes_quiz, Quizzes::Quiz.create!(
      :group_id => 1,
      :name => "Name",
      :introduction => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
