Rails.application.routes.draw do
  root 'categories#index'
  resources :users, :articles, :categories

  resources :articles do
    post 'upvote', on: :member
  end

  get 'random', to: 'articles#random', as: :random
  get 'logout', to: 'users#destroy', as: :logout

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
