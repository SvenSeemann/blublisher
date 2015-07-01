Rails.application.routes.draw do

  get 'epmloyment_notices/new'

  get 'epmloyment_notices/create'

  get 'epmloyment_notices/index'

  get 'epmloyment_notices/show'


  resources :departments
  resources :events
  mount Ckeditor::Engine => '/ckeditor'

  get 'newsletter/element/new', to: 'newsletters#new_element'
  post 'newsletter/element/save', to: 'newsletters#save_element'

  get 'newsletters/new', to: 'newsletters#new'
  get 'newsletters/:id', to: 'newsletters#show'


  root to: 'static#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :articles
  resources :categories
end
