Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/") 
  resources :menus
  get ':menu', to: 'menus#filter', as: :filter
  resources :menu_items
  resources :dininghalls
  root "dininghalls#index"
  
end
