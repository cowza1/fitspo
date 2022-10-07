Rails.application.routes.draw do

  devise_for :accounts

  root to: "pages#home"

  get "/dashboard" => "accounts#index"
  get "/profile/:username" => "accounts#show", as: :profile
  get "/profile/:username/edit" => "accounts#edit", as: :profile_edit


  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: :create
  end

  resources :accounts, only: [:index] do
    member do
      post :follow
      post :unfollow
    end
  end

  resources :conversations do
    resources :messages
  end

  resources :friends, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
