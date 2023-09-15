Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users
  resources :posts do
    resources :comments
  end
  get 'pages/about', to: 'pages#about'
  get '/u/:id', to: 'users#profile', as: 'user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
