Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'kits#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :kits do
    resources :steps, only: [:new, :create, :show, :destroy]
    namespace :intake do
      resources :titles, only: [:new, :create]
      resources :contents, only: [:new, :create]
    end
  end
  resources :steps, except: [:new, :create, :show, :destroy] do
    resources :tasks, only: [:new, :create, :destroy]
    member do
      get :add_media
      patch :save_media
    end
  end
end
