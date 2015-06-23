Rails.application.routes.draw do

  root to: 'static#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :articles
  resources :categories
end
