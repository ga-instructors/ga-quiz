Rails.application.routes.draw do

  resources :quizzes, module: :quizzes, as: 'quizzes_quiz'
  resources :quizzes, module: :quizzes do
    resources :assessments
  end
  get '/quizzes', to: 'quizzes/quiz#index', as: 'quizzes_quizzes'
  namespace :quizzes do
    resources :answers
    resources :questions
    resources :assessments
  end

  resources :sessions

  resources :users, except: [:new, :create] do
    resources :sessions
  end

  resources :groups do
    resources :quizzes, module: :quizzes
    get :regroup, on: :member
    resources :users, except: [:new, :create]
  end
  resources :group_members

  root to: 'sessions#new'
  match '*all', :to => 'application#not_found', via: :all
end
