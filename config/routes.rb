# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :usages, only: %i[index show edit update]
  resources :users, expect: %i[new create destroy]
  resources :plans
  resources :subscriptions
  resources :transactions, only: [:index]
  resources :features, only: %i[show edit update destroy]
  resources :checkout, only: [:create] do
    get 'add_subscription', on: :collection
  end
  resources :plans do
    resources :features, only: %i[index new create]
  end
  devise_scope :user do
    root action: 'new', controller: 'devise/sessions'
  end
  get '/home', action: 'home', controller: 'pages'
end
