Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :posts
  resources :users, only: [:show]

  get "profile/:user_id", to: "pages#profile", as: :profile
  get "my_profile", to: "pages#my_profile", as: :my_profile
  resources :posts do
    post 'create_comment', to: 'posts#create_comment', on: :member
  end
  resources :my_profile do
    post 'destroy_comment',to: 'posts#destroy_comment', on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
