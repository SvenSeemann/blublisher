Rails.application.routes.draw do

  resources :employment_notices

  get 'departments/:id/employment_notices', to: 'departments#get_employment_notices'
  resources :departments

  resources :events
  mount Ckeditor::Engine => '/ckeditor'

  get 'newsletter/element/new', to: 'newsletters#new_element'
  post 'newsletter/element/save', to: 'newsletters#save_element'
  get '/rails/mailers/*path' => "rails/mailers#preview"

  get 'newsletters/new', to: 'newsletters#new'
  get 'newsletters/:id', to: 'newsletters#show'


  root to: 'static#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :articles
  resources :categories
end
