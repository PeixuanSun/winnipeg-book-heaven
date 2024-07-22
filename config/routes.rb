Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: 'products#index'

  resources :product_categories
  resources :products do
    collection do
      match 'search' => 'products#search', via: [:get, :post], as: :search
    end
  end
  resources :orders
  resources :order_items
  resources :categories
  resource :cart, only: [:show]
  get 'cart/show'

end
