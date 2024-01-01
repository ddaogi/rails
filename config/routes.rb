Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
      resources :articles
      resources :comments
      resources :users
      resources :posts
      resources :characters
      resources :options
      root to: "articles#index"
  end
  # root "articles#index"


  namespace :api do
    namespace :toby do
      resources :posts
      resources :characters, only: %i[index show]
      resources :options
      resources :questions
      resources :surveys
      resources :responses
    end
  end
  resources :users, only: [:index]

  # get '/articles/new', to: 'articles#new'
  # get '/articles', to: 'articles#index'
  # get '/articles/:id', to: 'articles#show'

  resources :articles do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
