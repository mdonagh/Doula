Rails.application.routes.draw do

  get '/carts/checkout/:id', to: 'carts#checkout', as: :checkout
  get '/carts/payment_success', to: 'carts#payment_success'
  resources :line_items
  resources :carts
  resources :registry_types
  resources :service_categories
  resources :registries, param: :slug

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_for :affiliates, controllers: {
    sessions: 'affiliates/sessions'
  }

  devise_scope :user do
    get 'user/setup_wepay', :to => 'users/registrations#setup_wepay'
    get 'user/finish_wepay_setup', :to => 'users/registrations#finish_wepay_setup'
    get 'user/oauth(/:userid)', :to => 'users/registrations#oauth'
  end





  #Root page 
  root to: "pages#home"

  resources :services
  get '/articles/:article' => "articles#show"
  # get ':page' => "pages#show" 

  get 'search', to: 'registries#search_by_name'
 

  post '/add_to_registry/:service_id' => 'registries#add_service', as: :add_to_registry


end
