Rails.application.routes.draw do

  get 'newsletter/element/new', to: 'newsletters#new_element'

  get 'newsletters/new', to: 'newsletters#new'


  root to: 'static#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :articles
  resources :categories
end
