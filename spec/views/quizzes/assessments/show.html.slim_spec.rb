require 'rails_helper'

RSpec.describe "quizzes/assessments/show", type: :view do
  before(:each) do
    @assessment = @quizzes_assessment = assign(:quizzes_assessment, Quizzes::Assessment.create!(
      :quiz => create(:quiz),
      :user => create(:user),
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
