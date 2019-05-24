Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/thanks'
  resources :requests, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
