Rails.application.routes.draw do
  resources :choice_activities
  resources :activities
  resources :user_choices
  resources :choices 
  resources :users
  resources :addresses

  get '/', to: 'application#show', as: 'home'
  get 'login', to: "sessions#new", as: 'login'
  post 'sessions', to: "sessions#create", as: 'sessions' 
  delete 'sessions', to: "sessions#destroy", as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
