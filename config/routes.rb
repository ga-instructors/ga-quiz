Rails.application.routes.draw do
  namespace :quizzes do
    resources :quizzes
  end

  resources :sessions
  resources :group_members
  resources :users
  resources :groups
  root to: 'sessions#new'
end
