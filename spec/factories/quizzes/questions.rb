FactoryGirl.define do
  factory :quiz_question, class: 'Quizzes::Question' do
    association :quiz
  end
end
