Rails.application.routes.draw do
  # resources :registries
  # devise_for :users
  
  #Root page 
  # root to: "services#index"

  # resources :services
  get '/articles/:article' => "articles#show"
  # get ':page' => "pages#show" 

  # get 'search', to: 'registries#search_by_name'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
