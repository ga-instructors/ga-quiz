FactoryGirl.define do
  factory :session do
    association :user
    password 'password'
  end
end
