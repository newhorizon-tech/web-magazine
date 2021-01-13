Rails.application.routes.draw do
  resources :users, :categories, :articles
  root 'categories#index'
  get 'logout', to: 'users#destroy', as: :logout

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
