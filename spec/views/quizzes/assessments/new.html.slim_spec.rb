require 'rails_helper'

RSpec.describe "quizzes/assessments/new", type: :view do
  before(:each) do
    assign(:quizzes_assessment, Quizzes::Assessment.new(
      :quiz => nil,
      :user => nil,
      :student_comment => "MyText"
    ))
  end

  it "renders new quizzes_assessment form" do
    render

    expect(rendered).to include("Sorry,")
  end
end
