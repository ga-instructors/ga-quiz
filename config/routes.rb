Rails.application.routes.default_url_options[:host] = "ga-quiz.herokuapp.com"
Rails.application.routes.draw do

  namespace :quizzes do
    resources :answers
  end

  resources :quizzes, module: :quizzes, as: 'quizzes_quiz'
  resources :quizzes, module: :quizzes do
    resources :assessments do
      put :finish_all, on: :collection
    end
    resources :questions
  end
  get '/quizzes', to: 'quizzes/quiz#index', as: 'quizzes_quizzes'
  namespace :quizzes do
    resources :answers
    resources :questions
    resources :assessments
  end

  resources :sessions

  resources :users do
    resources :sessions
  end

  resources :groups do
    resources :quizzes, module: :quizzes
    get :regroup, on: :member
    resources :users, except: [:new, :create]
    resources :group_members, as: :member
  end
  resources :group_members

  root to: 'sessions#new'
  match '*all', :to => 'application#not_found', via: :all, constraints: { all: /(?!rails)/ }
end
