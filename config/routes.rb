Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :wines do
    resources :reviews, only: [:new, :create, :update, :edit]
  end

  resources :wineboxes, only: [:create]

  get '/my_cellar', to: 'wines#user_index'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/advices', to: 'pages#advices'
  get '/wines_all', to: 'wines#all'
  get '/my_cellar', to: 'wines#user_index'


  resources :orders, only: [:show, :create, :destroy] do
    resources :order_wines, only: [:create, :destroy, :update] do
      member do
        patch '/add', to: 'order_wines#add'
        patch '/remove', to: 'order_wines#remove'
      end
    end
    member do
      patch '/validate', to: 'orders#validate'
    end
    resources :payments, only: :new
  end

  resources :deliveries, only: [:show, :create, :destroy] do
    resources :delivery_products, only: [:create, :destroy, :update] do
      member do
        patch '/add', to: 'delivery_products#add'
        patch '/remove', to: 'delivery_products#remove'
      end
    end
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  get '/confirmation', to: 'pages#confirmation'

end
