Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'kits#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :kits do
    resources :steps, only: [:new, :create, :show, :destroy]
    post :send, action: :send_kit, on: :collection
  end
  resources :steps, except: [:new, :create, :show, :destroy] do
    resources :tasks, only: [:new, :create, :destroy]
  end
end
