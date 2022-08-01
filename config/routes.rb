# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # get '/login', to: 'login#form'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments, only: %i[new create show destroy]
      resources :likes, only: %i[new create destroy]
    end
  end
  root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
