Rails.application.routes.draw do
  resources :subscriptions
  resources :subscription_statuses
  resources :plans
  resources :submissions
  get 'dashboard/quizzes'
  get 'dashboard/take_quiz/:quiz_id', to: 'dashboard#take_quiz', as: 'dashboard_take_quiz'
  post 'dashboard/submit_answers'
  get 'dashboard/results'
  get 'dashboard/settings'
  get 'dashboard/manage_subs'
  get 'dashboard/create_sub'
  get 'dashboard/check_subs'

  get 'sessions/home'
  get 'sessions/login/:user_id', controller: 'sessions', action: 'login', as: 'sessions_login'
  delete 'sessions/logout', to: 'sessions#destroy'

  resources :answers
  resources :questions
  resources :quizzes
  resources :users

  root 'sessions#home'
end
