FactoryGirl.define do
  factory :quiz_assessment, class: 'Quizzes::Assessment' do
    association :quiz
    association :user
  end
end
