Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'kits#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :kits do
    resources :steps, only: [:index, :new, :create, :show, :destroy]
  end
  resources :steps, except: [:index, :new, :create, :show] do
    resources :tasks, only: [:new, :create]
  end
  resources :tasks, only: [:destroy], as: :destroy_task
end
