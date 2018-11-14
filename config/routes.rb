Rails.application.routes.draw do
  resources :tasks
  resources :notes
  resources :projects
  resources :collaborators, only: [:create, :show, :destroy]
  resources :users, only: [:index, :new, :create]
  root 'application#index'
  get '/login' => 'sessions#new'
  get '/signup' => 'users#new'
  post '/login' =>'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/collaborators/new/:id' => 'collaborators#new'

  get '*path', to: 'application#bad_route_redirect'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
