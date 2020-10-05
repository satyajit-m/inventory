Rails.application.routes.draw do
  root "welcome#index"

  resources :brands

  resources :categories do
    get "storage", on: :collection
  end

  resources :issues do
    patch "mark_resolved", on: :member
  end

  resources :items do
    get "created", on: :member
  end

  resources :notifications, except: [:edit] do
    post "mark_as_read", on: :collection
  end

  resources :users

  get "login", to: redirect("/auth/google_oauth2"), as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
end
