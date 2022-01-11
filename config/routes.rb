# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: %i[index show edit update]
  resources :usages, only: %i[index show edit update]
  resources :plans
  resources :subscriptions
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  default_url_options :host => "localhost"
  resources :transactions, only: [:index]
  resources :plans do
    resources :features, only: [:index, :new, :create]
  end
  resources :features, only: [:show, :edit, :update, :destroy]
  post 'checkout/create', to: "checkout#create"
  get 'checkout/add_subscription', to: "checkout#add_subscription"
  resources :checkout, only: [:create]
  get 'home' => 'pages#home'
end
