Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users
  root to: 'pages#home'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :requests, only: [:new, :create, :index] do
    member do
      get 'confirm'
      get 'reconfirm'
      get 'thanks'
    end
  end

  resources :rooms, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
