require 'rails_helper'

RSpec.describe "quizzes/assessments/show", type: :view do
  before(:each) do
    @quizzes_assessment = assign(:quizzes_assessment, Quizzes::Assessment.create!(
      :quiz => nil,
      :user => nil,
      :student_comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
