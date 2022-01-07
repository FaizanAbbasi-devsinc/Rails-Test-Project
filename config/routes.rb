# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, expect: %i[new create destroy]
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  default_url_options host: 'localhost'
  get '/home', to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :plans do
    resources :features, only: %i[index new create]
  end
  resources :features, only: %i[show edit update destroy]
end
