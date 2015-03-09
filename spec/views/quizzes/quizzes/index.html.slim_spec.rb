require 'rails_helper'

RSpec.describe "quizzes/quizzes/index", type: :view do
  before(:each) do
    assign(:quizzes_quizzes, [
      Quizzes::Quiz.create!(
        :group_id => 1,
        :name => "Name",
        :introduction => "MyText"
      ),
      Quizzes::Quiz.create!(
        :group_id => 1,
        :name => "Name",
        :introduction => "MyText"
      )
    ])
  end

  it "renders a list of quizzes/quizzes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
