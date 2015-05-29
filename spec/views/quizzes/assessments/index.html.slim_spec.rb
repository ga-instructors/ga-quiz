require 'rails_helper'

RSpec.describe "quizzes/assessments/index", type: :view do
  before(:each) do
    @quiz = create(:quiz)
    @user1 = create(:user)
    @user2 = create(:user)
    assign(:quizzes_assessments, [
      Quizzes::Assessment.create!(
        :quiz => @quiz,
        :user => @user1,
        :student_comment => "MyText"
      ),
      Quizzes::Assessment.create!(
        :quiz => @quiz,
        :user => @user2,
        :student_comment => "MyText"
      )
    ])
  end

  pending "renders a list of quizzes/assessments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
