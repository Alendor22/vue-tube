Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  # nested emails route
  resources :users, only: [:show] do 
    resources :emails
  end
  
  resources :users
  resources :emails
end