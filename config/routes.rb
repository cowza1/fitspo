Rails.application.routes.draw do

  devise_for :accounts

  root to: "pages#home"

  get "/dashboard" => "accounts#index"
  get "/profile/:username" => "accounts#show", as: :profile
  get "/profile/:username/edit" => "accounts#edit", as: :profile_edit
  get "friends/feed" => "friends#show", as: :feed
  get "/profile/:username/:id/workouts" => "workouts#accounts", as: :workout_accounts


  resources :posts, only: [:new, :create, :show, :destroy, :edit, :update] do
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


  resources :workouts do
    resources :exercises
  end

  resources :exercises, only: [:destroy]

  resources :foods, only: [:index, :show]

  resources :friends, only: [:index]

  resources :bios, only: [:new, :create, :destroy, :edit]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
