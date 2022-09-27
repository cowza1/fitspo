Rails.application.routes.draw do
  devise_for :accounts

  get "/dashboard" => "accounts#index"

  root to: "pages#home"

  resources :posts, only: [:new, :create, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
