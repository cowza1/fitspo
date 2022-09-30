Rails.application.routes.draw do
  devise_for :accounts

  root to: "pages#home"

  get "/dashboard" => "accounts#index"
  get "/profile/:username" => "accounts#show", as: :profile

  resources :posts, only: [:new, :create, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
