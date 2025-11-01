# frozen_string_literal: true

Rails.application.routes.draw do
  root "sessions#new"

  resource :session, only: %i[new create destroy]
  get "login", to: "sessions#new"
  delete "logout", to: "sessions#destroy"

  namespace :admin do
    get "dashboard", to: "dashboard#show"
    resources :clients
  end

  namespace :client, module: :client_portal do
    get "dashboard", to: "dashboard#show"
  end
end
