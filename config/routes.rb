Rails.application.routes.draw do
  namespace :quizzes do
    resources :answers
  end

  namespace :quizzes do
    resources :questions
  end

  namespace :quizzes do
    resources :assessments
  end

  resources :quizzes, module: :quizzes
  resources :quizzes, module: :quizzes, as: 'quizzes_quiz'
  get '/quizzes', to: 'quizzes/quiz#index', as: 'quizzes_quizzes'

  resources :sessions
  resources :group_members
  resources :users do
    resources :sessions
  end
  resources :groups do
    resources :quizzes, module: :quizzes
    get :regroup, on: :member
  end
  root to: 'sessions#new'
end
