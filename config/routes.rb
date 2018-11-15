Rails.application.routes.draw do

  root 'application#index'

  resources :projects do
    resources :collaborators, only: [:new, :create, :show, :destroy]
    resources :tasks
    resources :notes
  end
  resources :users, only: [:index, :new, :create]
  get '/projects/filter/:q' => 'projects#filter', as: 'project_filter'
  get '/login' => 'sessions#new'
  get '/signup' => 'users#new'
  post '/login' =>'sessions#create'
  delete '/logout' => 'sessions#destroy'


  get '*path', to: 'application#bad_route_redirect'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
