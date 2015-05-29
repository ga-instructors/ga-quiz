require 'rails_helper'

RSpec.describe "quizzes/quizzes/index", type: :view do
  before(:each) do
    @group = assign(:group, create(:group))
    assign(:quizzes_quizzes, [
      Quizzes::Quiz.new(
        :id => 1,
        :group => @group,
        :ordinal => 1,
        :name => "quiz1"
      ),
      Quizzes::Quiz.new(
        :id => 2,
        :group => @group,
        :ordinal => 2,
        :name => "quiz2"
      )
    ])
  end

  it "renders a list of quizzes/quizzes" do
    render
    assert_select "tr>td", :text => "I: quiz1".to_s, :count => 1
    assert_select "tr>td", :text => "II: quiz2".to_s, :count => 1
  end
end
