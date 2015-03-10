require 'rails_helper'

RSpec.describe "quizzes/assessments/index", type: :view do
  before(:each) do
    assign(:quizzes_assessments, [
      Quizzes::Assessment.create!(
        :quiz => nil,
        :user => nil,
        :student_comment => "MyText"
      ),
      Quizzes::Assessment.create!(
        :quiz => nil,
        :user => nil,
        :student_comment => "MyText"
      )
    ])
  end

  it "renders a list of quizzes/assessments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
