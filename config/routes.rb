Rails.application.routes.draw do
  namespace :step do
    get 'multistep/show'
    get 'multistep/update'
  end
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'kits#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :kits do
    resources :steps, only: [:new, :create, :show, :destroy] do
      resources :multisteps, only: [:show, :update], controller: 'step/multisteps'
    end
  end
  resources :steps, except: [:new, :create, :show, :destroy] do
    resources :tasks, only: [:new, :create, :destroy]
  end
end
