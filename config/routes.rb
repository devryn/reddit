Rails.application.routes.draw do
  resources :boards
  resources :downvotes
  resources :users
  resources :upvotes
  resources :links
  root 'boards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
