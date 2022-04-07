Rails.application.routes.draw do
  get 'pages/home'
  resources :properties, except: [:new, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
