Rails.application.routes.draw do
  devise_for :users
  root "homes#index"
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :homes, only: :index
  resources :users, only: [:show, :edit ,:update] do
    member do
      get 'mylist'
      get 'history'
    end
  end
  resources :posts do
    collection do
      get 'list'
      get 'search'
    end
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    resources :lists, only: [:index, :create, :destroy]
  end
end
