Pangea::Application.routes.draw do
  resources :projects

  resources :schools

  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
  
  resources :sessions
  resources :users
  resources :universities
  resources :uploads
  
  root to: 'application#index'
end
