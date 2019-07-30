Rails.application.routes.draw do
  resources :registry_types
  resources :service_categories
  resources :registries

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_for :affiliates, controllers: {
    sessions: 'affiliates/sessions'
  }

  #Root page 
  root to: "services#index"

  resources :services
  get '/articles/:article' => "articles#show"
  # get ':page' => "pages#show" 

  get 'search', to: 'registries#search_by_name'
end
