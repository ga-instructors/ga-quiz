require 'rails_helper'

RSpec.describe "quizzes/questions/show", type: :view do
  before(:each) do
    @quizzes_question = assign(:quizzes_question, Quizzes::Question.create!(
      :quiz => nil,
      :ordinal => 1,
      :question => "MyText",
      :open_ended => "",
      :answer => "MyText",
      :answer_option_id => 2,
      :answer_template => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
