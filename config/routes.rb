Rails.application.routes.draw do
  get 'pages/home'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :requests, only: [:new, :create] do
    member do
      get 'confirm'
      get 'reconfirm'
      get 'thanks'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
