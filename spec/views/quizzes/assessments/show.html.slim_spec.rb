require 'rails_helper'

RSpec.describe "quizzes/assessments/show", type: :view do
  before(:each) do
    @session = assign(:current_session, create(:session))
    @user = assign(:current_user, @session.user)
    @quiz = assign(:quiz, create(:quiz))
    @group = assign(:group, @quiz.group)
    @group_member = GroupMember.new(group: @group, role: :student, user: @session.user)
    @assessment = assign(:assessment, assign(:quizzes_assessment, Quizzes::Assessment.create!(
      :quiz => @quiz,
      :user => @user,
      :student_comment => "MyText"
    )))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
