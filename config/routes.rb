Rails.application.routes.draw do

resources :wikis

  devise_for :users
  get "welcome/index"  
  
   root 'welcome#index'
   
   resources :charges, only: [:new, :create]
   
   get "/users/:id/role_toggle", to: "users#role_toggle", as: :role_toggle
  
resources :users

end