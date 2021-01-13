Rails.application.routes.draw do
  resources :users, :articles, :categories

  resources :articles do
      member do
        post 'upvote'
      end
   end

  root 'categories#index'
  get 'logout', to: 'users#destroy', as: :logout



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
