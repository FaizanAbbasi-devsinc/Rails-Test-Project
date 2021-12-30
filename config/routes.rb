# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show edit update]
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  default_url_options :host => "localhost"
  get 'home' => 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
