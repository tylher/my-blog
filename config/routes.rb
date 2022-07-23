Rails.application.routes.draw do
  get '/login', to: 'login#form'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new]
    end
  end
  root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
