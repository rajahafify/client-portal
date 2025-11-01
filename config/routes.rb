# frozen_string_literal: true

Rails.application.routes.draw do
  root "sessions#new"

  resource :session, only: %i[new create destroy]
  get "login", to: "sessions#new"
  delete "logout", to: "sessions#destroy"

  resources :clients

  get "my_client", to: "clients#show_current", as: :my_client
end
