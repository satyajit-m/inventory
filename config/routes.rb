Rails.application.routes.draw do
  resources :brands
  resources :categories
  resources :issues do
    member do
      patch 'mark_resolved'
    end
  end
  resources :items do
    member do
      get 'assign', to: 'items#assign'
      patch 'assign', to: 'items#assign_user'
      patch 'remove_user'
    end
  end
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  resources :storages
  resources :users

  root 'welcome#index'
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
