Rails.application.routes.draw do
  get 'uploads/new'
  get 'uploads/create'
  get 'uploads/destroy'
  get 'categories/show'
  ActiveAdmin.routes(self)
  devise_for :users
  get '/', to: 'pages#home', as: 'home'
  resources 'medias', only: [:index, :show]
  resources 'rentals', only: [:create, :index, :update]
  resources 'artists', only: [:show]
  resources 'users', only: [:show, :edit, :update] do
    resources 'uploads', only: [:new, :create, :index]
  end
  resources 'uploads', only: [:destroy]
  resources 'categories', only: [:show]
  resources 'subscription_types', only: [:show, :update]
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
