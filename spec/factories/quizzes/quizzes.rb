FactoryGirl.define do
  factory :quiz, class: 'Quizzes::Quiz' do
    name 'Test Quiz'
    association :group
  end
end
