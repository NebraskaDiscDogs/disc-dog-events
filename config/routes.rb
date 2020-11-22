Rails.application.routes.draw do
  get 'dashboard/show'
  get 'sessions/new'
  get 'sessions/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: [:index], path_names: { new: "signup" }
  resources :dashboard, only: [:show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
