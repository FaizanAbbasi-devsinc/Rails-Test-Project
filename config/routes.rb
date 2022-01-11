# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, expect: %i[new create destroy]
  resources :plans
  resources :subscriptions
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  resources :transactions, only: [:index]
  default_url_options host: 'localhost'
  get '/home', to: 'pages#home'
  resources :plans do
    resources :features, only: %i[index new create]
  end
  resources :features, only: %i[show edit update destroy]
  post 'checkout/create', to: "checkout#create"
  get 'checkout/add_subscription', to: "checkout#add_subscription"
  resources :checkout, only: [:create]
  get 'home' => 'pages#home'
end
