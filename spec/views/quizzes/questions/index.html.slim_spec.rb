require 'rails_helper'

RSpec.describe "quizzes/questions/index", type: :view do
  before(:each) do
    assign(:quizzes_questions, [
      Quizzes::Question.create!(
        :quiz => nil,
        :ordinal => 1,
        :question => "MyText",
        :open_ended => "",
        :answer => "MyText",
        :answer_option_id => 2,
        :answer_template => "MyText"
      ),
      Quizzes::Question.create!(
        :quiz => nil,
        :ordinal => 1,
        :question => "MyText",
        :open_ended => "",
        :answer => "MyText",
        :answer_option_id => 2,
        :answer_template => "MyText"
      )
    ])
  end

  it "renders a list of quizzes/questions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
