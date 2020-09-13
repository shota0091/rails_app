Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
  resources :posts do
    resources :comments, only: :create
  end
end
