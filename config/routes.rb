Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :wines do
    resources :reviews, only: [:new, :create, :update, :edit]
  end

  get '/my_cellar', to: 'wines#user_index'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/advices', to: 'pages#advices'
  get '/wines_all', to: 'wines#all'

  resources :orders, only: [:create] do
    resources :order_wines, only: [:create]
  end
end
