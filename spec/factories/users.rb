FactoryGirl.define do
  factory :user do
    name 'Test User'
    password 'password'
    password_confirmation 'password'
  end
end
