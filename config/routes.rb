# frozen_string_literal: true

Rails.application.routes.draw do
  get 'transactions/index'
  devise_for :users
  resources :users, only: %i[index show edit update]
  resources :plans
  resources :subscriptions
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  default_url_options :host => "localhost"
  get 'home' => 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :plans do
    resources :features, only: [:index, :new, :create]
  end
  resources :features, only: [:show, :edit, :update, :destroy]
  post 'checkout/create', to: "checkout#create"
  get 'checkout/add_subscription', to: "checkout#add_subscription"

  resources :transactions, only: [:index]

end
