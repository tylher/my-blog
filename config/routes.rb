# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :html }
  get "/login", to: "login#form"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :users, only: %i[index show] do
  #   resources :posts, only: %i[index new create] do
  #     resources :comments, only: %i[new create]
  #     resources :likes, only: %i[new create]
  #   end
  # end

  get "posts/new", to: "posts#new", as: :new_post
  post "posts", to: "posts#create"
  post "/comments", to: "comments#create", as: :comments
  post "/likes", to: "likes#create", as: :likes

  get "/posts/:title", to: "posts#show", :as => :post

  root "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
