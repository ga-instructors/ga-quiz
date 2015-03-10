Rails.application.routes.draw do
  resources :quizzes, module: :quizzes
  resources :quizzes, module: :quizzes, as: 'quizzes_quiz'

  resources :sessions
  resources :group_members
  resources :users do
    resources :sessions
  end
  resources :groups do
    resources :quizzes, module: :quizzes
  end
  root to: 'sessions#new'
end
