Rails.application.routes.draw do
  resources :tasks
  resources :notes
  resources :projects
  resources :collaborators
  resources :users
  root 'application#index'
  get '/login' => 'sessions#new'
  # get '/signup' => 'users#new'
  post '/login' =>'sessions#create'
  delete '/logout' => 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
