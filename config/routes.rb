Rails.application.routes.draw do
  root 'categories#index'

  get 'logout', to: 'users#destroy', as: :logout
  resources :users, only: [:new, :create]

  resources :articles, only: [:new, :show] do
    post 'upvote', on: :member
    get 'random', to: 'articles#random', on: :collection
  end

  resources :categories, only: [:index, :show]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
