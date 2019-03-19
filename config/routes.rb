Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  get '/', to: 'pages#home', as: 'home'
  resources 'medias', only: [:index, :show]
  resources 'rentals', only: [:create, :index, :update]
  resources 'artists', only: [:show]
  resources 'users', only: [:show, :edit, :update] do
    resources 'uploads', only: [:new, :create, :index]
  end
  resources 'uploads', only: [:destroy, :update]
  resources 'categories', only: [:show]
  resources 'subscription_types', only: [:show, :index, :update]
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
  get 'rentals/display', to: 'rentals#display', as: 'display'
  patch 'rentals/:id', to: 'rentals#send', as: 'send'
end
