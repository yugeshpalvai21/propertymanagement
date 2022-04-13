Rails.application.routes.draw do
  get 'pages/home'
  resources :properties, except: [:new, :edit]
  resources :users, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
