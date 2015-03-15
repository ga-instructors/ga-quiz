require 'rails_helper'

RSpec.describe "quizzes/answers/index", type: :view do
  before(:each) do
    assign(:quizzes_answers, [
      Quizzes::Answer.create!(
        :grade => 1.5,
        :reviewer_comment => "MyText"
      ),
      Quizzes::Answer.create!(
        :grade => 1.5,
        :reviewer_comment => "MyText"
      )
    ])
  end

  it "renders a list of quizzes/answers" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
